import 'dart:ui';

import 'package:code_guide/bloc/chat_bloc.dart';
import 'package:code_guide/models/chat_message_model.dart';
import 'package:code_guide/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController chatScrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  ChatBloc chatBloc = ChatBloc();

  void scrollToBottom() {
    if (chatScrollController.hasClients) {
      final position = chatScrollController.position.maxScrollExtent;
      chatScrollController.animateTo(position,
          duration: Duration(seconds: 1), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false, // Disable leading/back button
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0),
            child: Text(
              "NovaConverse",
              style: text1(),
              textAlign: TextAlign.center,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(55),
              bottomRight: Radius.circular(55),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              return Column(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onPanStart: (details) {},
                      child: ListView.builder(
                        controller: chatScrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          // Align messages based on sender
                          final alignment = messages[index].role == "user"
                              ? Alignment.centerRight
                              : Alignment.centerLeft;

                          return Align(
                            alignment: alignment,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: messages[index].role == "user"
                                    ? Color(0XFF04A3FF).withOpacity(.4)
                                    : Color.fromARGB(255, 79, 79, 79)
                                        .withOpacity(.5),
                                borderRadius: messages[index].role == "user"
                                    ? BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50))
                                    : BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messages[index].role == "user"
                                        ? "You"
                                        : "Bot",
                                    style: text2(),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(messages[index].parts.first.text,
                                      style: messages[index].role == "user"
                                          ? text()
                                          : text().copyWith(
                                              fontStyle: FontStyle.italic)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 35, top: 10),
                      child: Row(
                        children: [
                          if (chatBloc.gen == true)
                            Lottie.asset("lib/assets/loading.json",
                                height: 50,
                                width: 50,
                                filterQuality: FilterQuality.high),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Ask questions to AI",
                                hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(.4),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: chatBloc.gen == false
                                ? () {
                                    if (textEditingController.text.isNotEmpty) {
                                      String text = textEditingController.text;
                                      textEditingController.clear();
                                      chatBloc.add(ChatGenerateNewTextEvent(
                                          inputMessage: text));
                                      if (chatBloc.gen == false) {
                                        scrollToBottom();
                                      }
                                    }
                                  }
                                : () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Text is generating"),
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    );
                                  },
                            child: CircleAvatar(
                              radius: 29,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  radius: 26,
                                  child: chatBloc.gen == false
                                      ? Icon(
                                          Icons.send_rounded,
                                          color: Colors.white,
                                          size: 29,
                                        )
                                      : Icon(
                                          Icons.pause_circle,
                                          color: Colors.white,
                                          size: 29,
                                        )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );

            default:
              return SizedBox(
                child: Center(child: Text("sOMETHING")),
              );
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white.withOpacity(0.3), // Adjust opacity as needed
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: FloatingActionButton.small(
            onPressed: scrollToBottom,
            child: Icon(Icons.arrow_downward),
            backgroundColor: Colors.transparent,
            elevation: 0, // No elevation
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
