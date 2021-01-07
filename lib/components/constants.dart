import 'package:flutter/material.dart';

final kTextFormDecoration = BoxDecoration(
  border: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid),
);

const kTextFiledFieldDecoration = InputDecoration(
//  hintStyle: TextStyle(color: Colors.grey),
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.grey, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.redAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMainTitleStyle = TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold);

const kHeadingTitleStyle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);

String smsApiUrl = "https://smshorizon.co.in/api/sendsms.php?user=info@cargaspoint.com&apikey=jgXHms98AJ4fvwtQdeXr&mobile=xxyy&message=xxyy&senderid=CARGAS&type=txt&tid=xyz";

String smsBaseUrl = "https://smshorizon.co.in/api/sendsms.php?user=info@cargaspoint.com&apikey=jgXHms98AJ4fvwtQdeXr&mobile=";