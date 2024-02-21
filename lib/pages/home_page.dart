import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55))),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 48.0,
              ),
              child: Text(
                "CodNexa",
                style: text1(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: ListView()),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(100)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 29,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 26,
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 29,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle text1() =>
      GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.bold);
}
