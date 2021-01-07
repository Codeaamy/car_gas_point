import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

class QuotationScreen extends StatefulWidget {
  @override
  _QuotationScreenState createState() => _QuotationScreenState();
}

class _QuotationScreenState extends State<QuotationScreen> {
  var _dropDownValue;
  HelperFunction _helperFunction = HelperFunction();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController vehicleCompanyController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController tankNameController = TextEditingController();
  TextEditingController tankCapacityController = TextEditingController();
  TextEditingController gasKitPriceController = TextEditingController();
  TextEditingController labourPriceController = TextEditingController();
  TextEditingController fittingPriceController = TextEditingController();
  TextEditingController taxPriceController = TextEditingController();

  bool spinner = false;

  @override
  Widget build(BuildContext context) {
    var width = _helperFunction.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Quotation"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    child: DropdownButton(
                      hint: _dropDownValue == null
                          ? Text('Select Quotation')
                          : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.blue),
                      ),

                      style: TextStyle(color: Colors.redAccent),
                      items: ['New Connection','Tank Service', 'Running Repair', 'Schedule Service'].map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                              () {
                            _dropDownValue = val;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),

              Container(
                height: 1,
                color: Colors.black,
              ),
              SizedBox(height: 10,),

              _dropDownValue == "New Connection" ? NewConnectionQuotation(context)
                  : _dropDownValue == "Tank Service" ? TankServiceQuotation(context)
                  : _dropDownValue == "Running Repair" ? RunningRepairQuotation(context)
                  : _dropDownValue == "Schedule Service" ? ScheduleServiceQuotation(context)
                  : Center(child: Text("Select Quotation Category"),)
            ],
          ),
        ),
      ),
    );
  }

  Widget NewConnectionQuotation(BuildContext context){
    var width = _helperFunction.getWidth(context);

    void clearForm(){
      nameController.text = "";
      phoneNumberController.text = "";
      vehicleTypeController.text = "";
      vehicleCompanyController.text = "";
      vehicleNameController.text = "";
      tankNameController.text = "";
      tankCapacityController.text = "";
      gasKitPriceController.text = "";
      labourPriceController.text = "";
      fittingPriceController.text = "";
      taxPriceController.text = "";
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: nameController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Full Name').copyWith(prefixIcon: Icon(Icons.person)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: phoneNumberController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Phone Number').copyWith(prefixIcon: Icon(Icons.call)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: vehicleTypeController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Vehicle Type').copyWith(prefixIcon: Icon(Icons.car_rental)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: vehicleCompanyController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Vehicle Company').copyWith(prefixIcon: Icon(Icons.car_rental)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: vehicleNameController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Vehicle Name').copyWith(prefixIcon: Icon(Icons.car_rental)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: tankNameController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Tank Name').copyWith(prefixIcon: Icon(Icons.local_gas_station_rounded)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                controller: tankCapacityController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Tank Capacity').copyWith(prefixIcon: Icon(Icons.local_gas_station_rounded)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: gasKitPriceController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Gas Kit Price').copyWith(prefixIcon: Icon(Icons.money)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: labourPriceController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Labour Charges').copyWith(prefixIcon: Icon(Icons.money)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: fittingPriceController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Fitting Charges').copyWith(prefixIcon: Icon(Icons.money)),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width * 0.9,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: taxPriceController,
                decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Tax').copyWith(prefixIcon: Icon(Icons.money)),
              ),
            ),
          ),

          customRoundButton(
            title: "Get Quotation",
            color: Colors.green,
            textColor: Colors.white,
            width: width * 0.8,
            onPressed: () async {
              var name = nameController.text;
              var phoneNumber = phoneNumberController.text;
              var vehicleType = vehicleTypeController.text;
              var vehicleName = vehicleNameController.text;
              var tankName = tankNameController.text;
              var tankCapacity = tankCapacityController.text;
              int gasKitPrice = int.parse(gasKitPriceController.text);
              int labourPrice = int.parse(labourPriceController.text) ;
              int fittingPrice = int.parse(fittingPriceController.text);
              int taxPrice =  int.parse(taxPriceController.text);
              var total = gasKitPrice + labourPrice + fittingPrice + taxPrice;
              var uuid = Uuid().v1();


              var message = '''Hello ${name}; \nThank You For Choosing Car Gas Point. \nYou have inquired with us for fitting a New Gas Kit Connection for your ${vehicleName}. \nTank name ${tankName} and Capacity of ${tankCapacity}. \nGas Kit Charges:- ${gasKitPrice}/-, \nFitting Charges:- ${fittingPrice}, \nLabour Charges:- ${labourPrice}, \nTax:- ${taxPrice} \nTotal:- ${total}. \nIf in doubt please give us a call. \n\nThank You, Regrads, \nCar Gas Point''';
              var encodedMessage = Uri.encodeFull(message);

              _helperFunction.showAlertWith2Buttons(context, AlertType.warning, "Confirm", message, "Cancel", Colors.white, Colors.red, () { Navigator.pop(context);}, "Ok", Colors.white, Colors.green, (){
               Navigator.pop(context);
                setState(() {
                  spinner = true;
                });

                Map<String, dynamic> data = {
                "name" : name,
                'type' : 'new_connection',
                "phoneNumber" : phoneNumber,
                "vehicleType" : vehicleType,
                "vehicleName" : vehicleName,
                "tankName" : tankName,
                'tankCapacity' : tankCapacity,
                'gasKitPrice' : gasKitPrice,
                'labourPrice' : labourPrice,
                'fittingPrice' : fittingPrice,
                'taxPrice' : taxPrice,
                'taxPrice' : taxPrice,
                'uid' : uuid,
                'date' : DateTime.now().millisecondsSinceEpoch,
              };

              FirebaseFirestore.instance.collection('quotation').doc(uuid).set(data).whenComplete(() {
                String smsApiUrl = '';
                http.post(smsApiUrl).then((value) {
                if(value.statusCode == 200){
                  setState(() {
                    spinner = false;
                    _helperFunction.showAlert(context, AlertType.success, "OK", 'Quotation added successfully', 'OK', (){
                      Navigator.pop(context);
                    });
                    clearForm();
                  });
                }else{
                  setState(() {
                    spinner = false;
                  });
                  _helperFunction.showAlert(context, AlertType.error, "Error sending message", "Unable to send message", "OK", (){Navigator.pop(context);});
                }
                });

              }).catchError((err){
                setState(() {
                  spinner = false;
                });

                _helperFunction.showAlert(context, AlertType.error, "Error Adding Data", "${err}", "OK", (){Navigator.pop(context);});

              });
              });
            },
          ),
        ],
      ),
    );


  }

  Widget TankServiceQuotation(BuildContext context){
    return Text("Tank Service");
  }

  Widget RunningRepairQuotation(BuildContext context){
    return Text("Running Repair");

  }

  Widget ScheduleServiceQuotation(BuildContext context){
    return Text("Schedule Service");


  }
}
