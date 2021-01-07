import 'dart:async';
import 'package:cargaspoint/components/constants.dart';
import 'package:cargaspoint/screens/detail_service_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class TankServicing extends StatefulWidget {
  @override
  _TankServicingState createState() => _TankServicingState();
}


class _TankServicingState extends State<TankServicing> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> connectionList;
  StreamSubscription<QuerySnapshot> streamSubscription;
  bool spinner = true;

  @override
  void initState() {
    // TODO: implement initState
    getConnectionFromDatabase();
    super.initState();
  }


  void getConnectionFromDatabase(){
    streamSubscription = _firestore.collection('new_connection').orderBy('lastTimeEdited', descending: true).snapshots().listen((dataSnapshot) {
      if(dataSnapshot != null){
        if(this.mounted) {
          setState(() {
            spinner = false;
            connectionList = dataSnapshot.docs;
          });
        }
      }
    });

  }



  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double optionWidth = 100;
    Color optionColour = Colors.blue[50];


    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
              decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Name Search').copyWith(prefixIcon: Icon(Icons.search))
              ),
            ),
            connectionList == null ? Center(child: Column(children: [CircularProgressIndicator(), Text('Loading ...')],),) :
            Expanded(
              child: ListView.builder(
                itemCount: connectionList.length,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(width: optionWidth,
                                  color: optionColour,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Name'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(connectionList[index]['name'].toString()),
                                ),

                              ],
                            ),
                            Container(height: 1, color: Colors.blue,),
                            Row(
                              children: [
                                Container(width: optionWidth,
                                  color: optionColour,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Ph No.'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(connectionList[index]['phoneNumber'].toString()),
                                ),

                              ],
                            ),
                            Container(height: 1, color: Colors.blue,),

                            Row(
                              children: [
                                Container(width: optionWidth,
                                  color: optionColour,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Vehicle'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(connectionList[index]['vehicleName'].toString()),
                                ),

                              ],
                            ),
                            Container(height: 1, color: Colors.blue,),

                            Row(
                              children: [
                                Container(width: optionWidth,
                                  color: optionColour,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Vehicle No.'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(connectionList[index]['vehicleNumberPlate'].toString()),
                                ),

                              ],
                            ),
                            Container(height: 1, color: Colors.blue,),

                            Row(
                              children: [
                                Container(width: optionWidth,
                                  color: optionColour,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Connection Date'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(connectionList[index]['connectionDate'].toString()),
                                ),
                              ],
                            ),
//                          Container(height: 1, color: Colors.blue,),
                          ],
                        ),
                      )
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailServiceScreen(uid: connectionList[index]['uid'],)));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
