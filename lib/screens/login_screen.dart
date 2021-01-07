import 'package:cargaspoint/HelperFunction.dart';
import 'package:cargaspoint/Widgets/customRoundButton.dart';
import 'package:cargaspoint/components/constants.dart';
import 'package:cargaspoint/screens/main_screen.dart';
import 'package:cargaspoint/screens/selection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  HelperFunction _helperFunction = HelperFunction();
  bool spinner = false;


  @override
  Widget build(BuildContext context) {
    var width = _helperFunction.getWidth(context);
    var height = _helperFunction.getHeight(context);

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){

            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                Hero(
                  tag: "cgp_logo",
                  child: Container(

                    height: 200,
                    child:
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Image.asset('images/cgp_logo_1.png'),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Login In", style: kMainTitleStyle,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: width * 0.8,
                      height: 50,
                      child: TextFormField(
                        controller: emailTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          prefixIcon: Icon(Icons.email)

                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: width * 0.8,
                      height: 50,
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordTextEditingController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.email)

                        ),
                      ),
                    ),
                  ),
                ),
                customRoundButton(title: 'Login', textColor: Colors.white, color: Colors.green,width: width * 0.8, onPressed: (){
                  loginUser();
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginUser(){
    setState(() {
      spinner = true;
    });

    var email = emailTextEditingController.text;
    var password = passwordTextEditingController.text;

    if(email != "" && password != ""){
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).whenComplete((){
        //Navigate To Main Screen
        print('User Logged In');
        setState(() {
          spinner = false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectionScreen()));

      }).catchError((err) => {
        _helperFunction.showAlert(context, AlertType.error, 'Error Login In', "${err}", 'OK', (){
          setState(() {
            spinner = false;
          });
          Navigator.pop(context);
        })
      });
    }else{
      setState(() {
        spinner = false;
      });
      _helperFunction.showAlert(context, AlertType.error, 'Email & Password Is Blank', 'Email and Password cannot be left blank', 'OK',(){
        Navigator.pop(context);
      });
    }
  }
}
