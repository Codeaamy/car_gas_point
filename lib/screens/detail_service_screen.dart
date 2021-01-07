import 'dart:async';

import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/screens/history_screen.dart';
import 'package:cargaspoint/screens/servicing_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailServiceScreen extends StatefulWidget {

  final String uid;
  const DetailServiceScreen({Key key, this.uid}) : super(key: key);


  @override
  _DetailServiceScreenState createState() => _DetailServiceScreenState();
}

class _DetailServiceScreenState extends State<DetailServiceScreen> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> detailList;
  StreamSubscription<QuerySnapshot> streamSubscription;
  HelperFunction _helperFunction = HelperFunction();
  Color optionColor = Colors.red[50];

  @override
  void initState() {
    // TODO: implement initState
    getDetailServiceTank();
    super.initState();
  }

  void getDetailServiceTank(){
    _firestore.collection('new_connection').doc(widget.uid).snapshots().listen((event) {
      if(event != null){
        setState(() {
          detailList = event.data();
        });
        print(detailList);
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    var width = _helperFunction.getWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Service Page"),
        actions: [
          IconButton(icon: Icon(Icons.update), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen(
                history: detailList['servicingHistory'],
              )));
          })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: detailList != null ?
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customRoundButton(
                    title: 'Servicing',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicingScreen(
                          uid: detailList['uid'].toString(),
                          heading: "Scheduled Servicing",
                          connectionType: "Scheduled Servicing",
                          name: detailList['name'].toString(),
                          phoneNumber: detailList['phoneNumber'].toString(),

                        )));
                    },
                  ),
                  customRoundButton(
                    title: 'Tank Service',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServicingScreen(
                        uid: detailList['uid'].toString(),
                        heading: "Tank Servicing",
                        connectionType: "Tank Servicing",
                        name: detailList['name'].toString(),
                        phoneNumber: detailList['phoneNumber'].toString(),

                      )));
                    },
                  ),
                  customRoundButton(
                    title: 'Running Repair',
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ServicingScreen(
                        uid: detailList['uid'].toString(),
                        heading: "Running Repair Servicing",
                        connectionType: "Running Repair",
                        name: detailList['name'].toString(),
                        phoneNumber: detailList['phoneNumber'].toString(),


                      )));

                    },
                  ),


                ],
              ),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['name'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Ph. No.'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['phoneNumber'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Schedule Servicing'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['scheduleServicing'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Date Of Connection'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['connectionDate'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vehicle Type'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['vehicleType'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vehicle Company'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['vehicleCompany'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),


              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vehicle Number'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['vehicleNumberPlate'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Vehicle Chasis Number'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['vehicleChasis'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Tank Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['tankName'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Tank Number'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['tankNumber'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Tank Mfg Date'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['tankMfgDate'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Water Capacity'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['waterCapacity'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Weight In Kg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['weightInKg'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Test Pressure'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['testPressure'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Certifying Company Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['certifyingCompanyName'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),

              Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.4,
                      color: optionColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Certifying Number'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(detailList['certifyingNumber'].toString()),
                    )
                  ],
                ),
              ),
              Container(height: 1, color: Colors.red,),


            ],
          ),
        ) : Center(child: Column(children: [CircularProgressIndicator(), Text('Loading ...')],),)
      ),
    );
  }
}
