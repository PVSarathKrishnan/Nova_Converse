import 'package:flutter/material.dart';
import 'package:code_guide/utils/styles.dart';
import 'package:code_guide/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/download1.jpg"),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to",
                  style: GoogleFonts.sacramento(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Nova Converse",
                  style: GoogleFonts.righteous(
                      color: Colors.deepPurpleAccent,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3)),
              SizedBox(height: 50),
              Material(
                elevation: 10,
                shadowColor: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("What is Gemini?",
                              style: text1().copyWith(color: Colors.black)),
                          SizedBox(height: 10),
                          Text(
                            "Gemini is not just an ordinary chatbot; it's a powerful artificial intelligence system developed by CodeNexa. It's like having your own virtual assistant right at your fingertips. Gemini is designed to understand and respond to natural language queries, providing intelligent and engaging conversations.",
                            style: text().copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          Text("What is Nova Converse?",
                              style: text1().copyWith(color: Colors.black)),
                          SizedBox(height: 10),
                          Text(
                            "Nova Converse is the name of our revolutionary chat application powered by Gemini AI. It's not just another chat app; it's a gateway to endless possibilities. Nova Converse allows users to interact with Gemini and explore a wide range of topics, from casual conversations to practical assistance.",
                            style: text().copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          Text("How was the app created with Gemini AI?",
                              style: text1().copyWith(color: Colors.black)),
                          SizedBox(height: 10),
                          Text(
                            "Creating an app with Gemini AI was an exciting journey! It involved harnessing the power of advanced machine learning algorithms and natural language processing techniques. We carefully crafted each feature to ensure seamless integration with Gemini, resulting in a user-friendly and interactive experience.",
                            style: text().copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 20),
                          Text("What's the usage of this chat bot?",
                              style: text1().copyWith(color: Colors.black)),
                          SizedBox(height: 10),
                          Text(
                            "The usage of this chat bot is as limitless as your imagination! Whether you need quick answers to questions, assistance with tasks, or simply want to engage in fun and engaging conversations, Nova Converse powered by Gemini AI is here to enhance your everyday life.",
                            style: text().copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 35,
        
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Container(
            child: Lottie.asset("lib/assets/loading.json",
                filterQuality: FilterQuality.high),
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(.9),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
