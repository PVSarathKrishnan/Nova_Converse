import 'package:flutter/material.dart';
import 'package:code_guide/pages/splash2.dart';
import 'package:code_guide/utils/styles.dart';
import 'package:lottie/lottie.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  bool _showWelcomeText = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showWelcomeText = false;
      });
    });
    // After 4 seconds, navigate to Splash2
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Splash2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: _showWelcomeText ? 1.0 : 0.0,
            child: Column(
              children: [
                Text(
                  "Welcome to",
                  style:
                      text1().copyWith(fontSize: 40, color: Color(0XFF04A3FF)),
                ),
                SizedBox(height: 8),
                Text(
                  "NovaConverse",
                  style:
                      text1().copyWith(fontSize: 35, color: Color(0XFFFD04FE)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Lottie.asset("lib/assets/loading.json"),
        ],
      ),
    );
  }
}
