import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;


class ServicingScreen extends StatefulWidget {
  final String uid;
  final String connectionType;
  final String heading;
  final String name;
  final String phoneNumber;

  const ServicingScreen({Key key, this.uid, this.connectionType, this.heading, this.name, this.phoneNumber}) : super(key: key);
  @override
  _ServicingScreenState createState() => _ServicingScreenState();
}

class _ServicingScreenState extends State<ServicingScreen> {
  TextEditingController checkListController = TextEditingController();
  TextEditingController chargeListController = TextEditingController();



  List<String> servicingCheckList = [];
  List<int> chargesList = [];
  bool spinner = false;
  var totalBill = 0;

  HelperFunction _helperFunction = HelperFunction();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    var width = HelperFunction().getWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicing'),

      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(widget.heading, style: kMainTitleStyle,)),
            ),
            IconButton(icon: Icon(Icons.add, color: Colors.green,),
                onPressed: (){
                  Alert(
                      context: context,
                      title: "Add Service Item",
                      content: Column(
                        children: <Widget>[
                          Container(
                            width: width * 0.8,
                            child: TextField(
                              controller: checkListController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.account_circle),
                                labelText: 'Item',
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.8,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: chargeListController,
                              decoration: InputDecoration(
                                icon: Icon(Icons.money),
                                labelText: 'Charges',
                              ),
                            ),
                          ),
                        ],
                      ),
                      buttons: [
                        DialogButton(
                          onPressed: (){

                            if(chargeListController.text != "" && checkListController.text != ""){
                              var amount = int.parse(chargeListController.text);
                              setState(() {
                                chargesList.add(amount);
                                servicingCheckList.add(checkListController.text);
                                checkListController.text = "";
                                chargeListController.text = "";
                              });
                            }
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                }
            ),


            servicingCheckList.length  != 0 ?
            Expanded(
              child: ListView.builder(
                itemCount: servicingCheckList.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                            ),
                          ),
                          SizedBox(width: 20,),

                          Text(servicingCheckList[index].toString()),
                          Spacer(),
                          IconButton(icon: Icon(Icons.remove, color: Colors.red,), onPressed: (){
                            setState(() {
                              servicingCheckList.removeAt(index);
                              chargesList.removeAt(index);
                            });
                          })
                        ],
                      ),
                    ),
                  );
                },

              ),
            ) : Text("Add Check List Data", style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal
            ),),
              servicingCheckList.length != 0 ?
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: customRoundButton(
                  width: width ,
                  title: "Clear All",
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: (){
                    setState(() {
                      servicingCheckList.length = 0;
                      chargesList.length = 0;
                    });
                  },
                ),
              ): (Container()),
            servicingCheckList.length != 0 ?
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: customRoundButton(
                width: width ,
                title: "Add To Data",
                textColor: Colors.white,
                color: Colors.green,
                onPressed: (){
                  setState(() {
                    spinner = true;
                  });
                  var date = DateTime.now().millisecondsSinceEpoch.toString();

                  totalBill = chargesList.fold(0, (p, c) => p + c);

                   print(totalBill);

                  Map<String, dynamic> data = {
                    'servicingType' : widget.heading,
                    'DateOfServicing': date,
                    'servicingCharges' : chargesList,
                    'totalBill' : totalBill,
                    'workDone' : servicingCheckList,
                  };


                  FirebaseFirestore.instance.collection('new_connection').doc(widget.uid).update({"servicingHistory": FieldValue.arrayUnion([data])}).whenComplete(() {
                    setState(() {
                      spinner = false;
                      servicingCheckList.length = 0;
                      chargesList.length = 0;
                    });

                    var message = '''Hello ${widget.name}; \nThank You For Choosing Car Gas Point. \nWe have just finished ${widget.connectionType} \nYour car is ready and feel like completely new\n \nYou can come and pick your car. \n Your total bill is ₹${totalBill}. If in doubt please give us a call. \n\nThank You, Regrads, \nCar Gas Point''';
                    var encodedMessage = Uri.encodeFull(message);

                    String smsApiUrl = '';
                    print(smsApiUrl);
                    http.post(smsApiUrl).then((value) {
                      if(value.statusCode == 200){
                        setState(() {
                          spinner = false;
                          _helperFunction.showAlert(context, AlertType.success, "Success", 'Message Sent Successful', 'OK', (){
                            Navigator.pop(context);
                          });
                        });
                      }else{
                        setState(() {
                          spinner = false;
                        });
                        _helperFunction.showAlert(context, AlertType.error, "Error sending message", "Unable to send message", "OK", (){Navigator.pop(context);});
                      }
                    });

                  }).catchError((error){
                    setState(() {
                      spinner = false;
                    });
                    _helperFunction.showAlert(context, AlertType.error, 'Error', '${error}', 'OK', () => Navigator.pop(context));
                  });
                },
              ),
            ): (Container()),
          ],
        ),
      ),
    );
  }
}
