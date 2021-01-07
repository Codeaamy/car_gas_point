

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HelperFunction{

  double getWidth(BuildContext context){
    var widht = MediaQuery.of(context).size.width;
    return widht;
  }

  double getHeight(BuildContext context){
    var height = MediaQuery.of(context).size.height;
    return height;
  }

  showAlert(BuildContext context, AlertType alertType,  String title, String desc, String btnText, Function onpressed){
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            btnText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onpressed,
          width: 120,
        )
      ],
    ).show();
  }

  showAlertWith2Buttons(BuildContext context, AlertType alertType,  String title, String desc, String buttonText1, Color buttonColorText1, Color buttonColor1, Function onPressed1,
        String buttonText2, Color buttonTextColor2, Color buttonColor2, Function onPressed2
      ){
    Alert(
      context: context,
      type: alertType,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            buttonText1,
            style: TextStyle(color: buttonColorText1, fontSize: 20),
          ),
          onPressed: onPressed1,
          color: buttonColor1
        ),
        DialogButton(
          child: Text(
            buttonText2,
            style: TextStyle(color: buttonTextColor2, fontSize: 20),
          ),
          onPressed: onPressed2,
          color: buttonColor2,

        )
      ],
    ).show();
  }

  void showAddServicingAlert(BuildContext context, Function onPressed, double width){
    Alert(
        context: context,
        title: "Add Service Item",
        content: Column(
          children: <Widget>[
            Container(
              width: width * 0.8,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Item',
                ),
              ),
            ),
            Container(
              width: width * 0.8,
              child: TextField(
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
            onPressed: onPressed,
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }


  String getTimeStamp(String timeStamp){
    var stamp = int.parse(timeStamp);
    var date = DateTime.fromMillisecondsSinceEpoch(stamp).toString();
    var time = date.substring(11, 16);
    return time;
  }

  String getDateStamp(String timeStamp){
    var stamp = int.parse(timeStamp);
    var date = DateTime.fromMillisecondsSinceEpoch(stamp).toString();
    var month = date.substring(5,7);
    var day = date.substring(8,10);
    var year = date.substring(0,4);
    var dateString = "${day}/${month}/${year}";
    return dateString;
  }


}