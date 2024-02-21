import 'package:code_guide/bloc/chat_bloc_bloc.dart';
import 'package:code_guide/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;

              return Column(
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
                  Expanded(
                      child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Text(messages[index].parts.first.text));
                          })),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 35),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: textEditingController,
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
                                        color:
                                            Theme.of(context).primaryColor))),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                chatBloc.add(ChatGenerateNewTextMessageEvent(
                                  inputMessage: textEditingController.text,
                                ));
                              }
                            },
                            child: CircleAvatar(
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
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );

            default:
              return SizedBox(
                child: Center(child: Text("something wrong")),
              );
          }
        },
      ),
    );
  }

  TextStyle text1() =>
      GoogleFonts.josefinSans(fontSize: 28, fontWeight: FontWeight.bold);
}
