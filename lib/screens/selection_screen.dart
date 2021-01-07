import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/screens/main_screen.dart';
import 'package:cargaspoint/screens/quotation_screen.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: customRoundButton(
              title: "Connection & Servicing",
              textColor: Colors.white,
              color: Colors.green[800],
              width: 100,
              height: 100,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: customRoundButton(
              title: "Quotation",
              textColor: Colors.white,
              color: Colors.green[800],
              width: 100,
              height: 100,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuotationScreen()));

              },
            ),
          ),
        ],
      ),
    );
  }
}
