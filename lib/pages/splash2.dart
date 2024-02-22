import 'package:code_guide/pages/home_page.dart';
import 'package:code_guide/pages/startup_page.dart';
import 'package:flutter/material.dart';
import 'package:code_guide/utils/styles.dart';
import 'package:lottie/lottie.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  bool _showWelcomeText = false;

  @override
  void initState() {
    super.initState();
    // After 2 seconds, fade in the welcome text
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _showWelcomeText = true;
      });
    });
    // After 4 seconds, navigate to Splash2
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => StartUpPage()),
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
                  "Powered By",
                  style:
                      text1().copyWith(fontSize: 40, color: Color(0XFF04A3FF)),
                ),
                SizedBox(height: 8),
                Text(
                  "Google's Gemini AI",
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
