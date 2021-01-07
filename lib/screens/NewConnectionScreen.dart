import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class NewConnection extends StatefulWidget {
  @override
  _NewConnectionState createState() => _NewConnectionState();
}

class _NewConnectionState extends State<NewConnection> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController vehicleCompanyController = TextEditingController();
  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController tankNameController = TextEditingController();
  TextEditingController tankNumberController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController vehicleChasisNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfConnectionController = TextEditingController();
  TextEditingController tankDateMfgController = TextEditingController();
  TextEditingController waterCapacityController = TextEditingController();
  TextEditingController weightInKgController = TextEditingController();
  TextEditingController testPressureController = TextEditingController();
  TextEditingController certifyingCompanyController = TextEditingController();
  TextEditingController certificateNumberController = TextEditingController();
  HelperFunction _helperFunction = HelperFunction();


  var dateString = "Date Of Connection";
  var tankMfgDate = 'Tank Mfg Date';

  bool spinner = false;


  @override
  Widget build(BuildContext context) {

    var width = _helperFunction.getWidth(context);
    return ModalProgressHUD(
      inAsyncCall: spinner,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: fullNameController,
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
                child: customRoundButton(title: dateString, textColor: Colors.white, color: Colors.blue, width: width * 0.8, onPressed: (){
                      _newConnectionDate(context);
                },)
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
                    controller: vehicleNumberController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Vehicle Number Plate').copyWith(prefixIcon: Icon(Icons.confirmation_number_sharp)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: vehicleChasisNumberController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Vehicle Chasis Number').copyWith(prefixIcon: Icon(Icons.drive_file_move_outline)),
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
                    controller: tankNumberController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Tank Number').copyWith(prefixIcon: Icon(Icons.confirmation_num)),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: customRoundButton(title: tankMfgDate, textColor: Colors.white, color: Colors.blue, width: width * 0.8, onPressed: (){
                  _tankMfgDate(context);
                  },)
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: waterCapacityController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Water Capacity').copyWith(prefixIcon: Icon(Icons.branding_watermark_outlined)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: weightInKgController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Weight In Kg').copyWith(prefixIcon: Icon(Icons.line_weight)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: testPressureController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Test Pressure').copyWith(prefixIcon: Icon(Icons.compress)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: certifyingCompanyController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Certifying Company Name').copyWith(prefixIcon: Icon(Icons.account_balance)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  width: width * 0.9,
                  child: TextFormField(
                    controller: certificateNumberController,
                    decoration: kTextFiledFieldDecoration.copyWith(hintText: 'Certifying Number').copyWith(prefixIcon: Icon(Icons.all_inclusive)),
                  ),
                ),
              ),

              customRoundButton(title: 'Create Connection', textColor: Colors.white, color: Colors.green, width: width * 0.8, onPressed: (){
                addDataToDatabase();
              },)
            ],
          )

        ),
      ),
    );
  }

  _newConnectionDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        helpText: 'Select New Connection Date',
        cancelText: "Cancel",
        confirmText: "Ok"
    );
    if(picked != null){
      setState(() {
        var date = picked.toString();
        var month = date.substring(5,7);
        var day = date.substring(8,10);
        var year = date.substring(0,4);
        dateString = "${day}/${month}/${year}";


      });
    }
  }

  _tankMfgDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        helpText: 'Select New Connection Date',
        cancelText: "Cancel",
        confirmText: "Ok"
    );
    if(picked != null){
      setState(() {
        var date = picked.toString();
        var month = date.substring(5,7);
        var day = date.substring(8,10);
        var year = date.substring(0,4);
        tankMfgDate = "${day}/${month}/${year}";


      });
    }
  }

  String getScheduledServicingDate(){
    var date = DateTime.now().add(Duration(days: 180)).toString();
    var month = date.substring(5,7);
    var day = date.substring(8,10);
    var year = date.substring(0,4);

    return "${day}/${month}/${year}";
  }



  void addDataToDatabase(){
    if(fullNameController.text == ""){
      Toast.show("Full Name cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    }else if(phoneNumberController.text == "") {
      Toast.show("Phone Number cannot be empty", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }else if(vehicleTypeController.text == ""){
      Toast.show("Vehicle Type cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(vehicleCompanyController.text == ""){
      Toast.show("Vehicle Company cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(vehicleNameController.text == ""){
      Toast.show("Vehicle Name cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(vehicleNumberController.text == ""){
      Toast.show("Vehicle Number cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(vehicleChasisNumberController.text == ""){
      Toast.show("Vehicle Chasis Number cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(tankNameController.text == ""){
      Toast.show("Tank Name cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(tankNumberController.text == ""){
      Toast.show("Tank Number cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(waterCapacityController.text == ""){
      Toast.show("Water Capacity cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(weightInKgController.text == ""){
      Toast.show("Weight cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if (testPressureController.text == ""){
      Toast.show("Test Pressure cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(certifyingCompanyController.text == ""){
      Toast.show("Certifying Company cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


    }else if(certificateNumberController.text == ""){
      Toast.show("Certificate Number cannot be empty", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

    }
//
    setState(() {

    });
    Toast.show("Adding Data to database", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    setState(() {
      spinner = true;
    });

    String scheduledServicingDate = getScheduledServicingDate();

    var uuid = Uuid().v1();


    Map<String, dynamic> data = {
      "uid" : uuid,
      "name" : fullNameController.text,
      "phoneNumber" : phoneNumberController.text,
      "connectionDate" : dateString,
      "vehicleType" : vehicleTypeController.text,
      "vehicleCompany": vehicleCompanyController.text,
      "vehicleName" : vehicleNameController.text,
      "vehicleNumberPlate": vehicleNumberController.text,
      "vehicleChasis": vehicleChasisNumberController.text,
      "tankName": tankNameController.text,
      "tankNumber" : tankNumberController.text,
      "tankMfgDate" : tankMfgDate,
      "waterCapacity": waterCapacityController.text,
      "weightInKg": weightInKgController.text,
      "testPressure" : testPressureController.text,
      "certifyingCompanyName" : certifyingCompanyController.text,
      "certifyingNumber" : certificateNumberController.text,
      'scheduleServicing' : scheduledServicingDate,
      "timeStamp" : DateTime.now().millisecondsSinceEpoch,
      "lastTimeEdited" : DateTime.now().millisecondsSinceEpoch,
      'tankServicingDone' : 0,
      'servicingHistory' : [{
          "DateOfServicing" : "",
          "workDone" : [],
          "servicingCharges": [],
          'totalBill' : 5000,
      }],
      'connectionCharges' : 30000,
      'nameSearchKey' : fullNameController.text.substring(0,1).toUpperCase(),
    };


    FirebaseFirestore.instance.collection('new_connection').doc(uuid).set(data).then((value){
      _helperFunction.showAlert(context, AlertType.success, 'Successful', "New Connection Added Succssfully", 'OK', (){
        Navigator.pop(context);
      });
      clearForm();
    }).catchError((err){
      setState(() {
        spinner = false;
      });
      _helperFunction.showAlert(context, AlertType.error, "Error", "Error Adding Connection To Database", 'OK', (){
        Navigator.pop(context);
      });
    });
  }


  void textMessageOfNewConnection(){


  }

  void clearForm(){
    setState(() {
      spinner = false;
      fullNameController.text = "" ;
      vehicleCompanyController.text = "" ;
      vehicleNameController.text = "" ;
      vehicleTypeController.text = "" ;
      tankNameController.text = "" ;
      tankNumberController.text = "" ;
      vehicleNumberController.text = "" ;
      vehicleChasisNumberController.text = "" ;
      phoneNumberController.text = "" ;
      dateOfConnectionController.text = "" ;
      tankDateMfgController.text = "" ;
      waterCapacityController.text = "" ;
      weightInKgController.text = "" ;
      testPressureController.text = "" ;
      certifyingCompanyController.text = "" ;
      certificateNumberController.text = "" ;
    });
  }


}
