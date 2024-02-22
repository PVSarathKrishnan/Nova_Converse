import 'package:code_guide/pages/home_page.dart';
import 'package:code_guide/pages/splash2.dart';
import 'package:code_guide/pages/splash1.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1(),
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Color(0XFF04A3FF)),
    );
  }
}
