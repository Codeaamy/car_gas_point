import 'package:cargaspoint/components/constants.dart';
import 'package:cargaspoint/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  bool _resized = false;
  AnimationController _controller ;

  @override
  void initState(){
    super.initState();
    navigate();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 300,

    );
    _controller.forward();
    _controller.addListener((){
      setState(() {
        print(_controller.value);
      });

    });

  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white.withAlpha(1),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Hero(
              tag: "cgp_logo",

              child: Container(

                  height: _controller.value,
                  child:
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Image.asset('images/cgp_logo_1.png'),
                  ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle
                ),
              ),
            ),
            SizedBox(height: 50,),
            Center(
              child: Text('Car Gas Point', style: kMainTitleStyle,),
            )

          ],
        ),
      ),
    );
  }
}
