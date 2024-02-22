import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_guide/models/chat_message_model.dart';
import 'package:code_guide/repositories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatSuccessState(messages: [])) {
    on<ChatGenerateNewTextEvent>(_chatGenerateNewTextEvent);
  }

  List<ChatMessageModel> messages = [];
  bool gen = false;

  Future<void> _chatGenerateNewTextEvent(
      ChatGenerateNewTextEvent event, Emitter<ChatState> emit) async {
    // Add user message
    messages.add(ChatMessageModel(
        role: "user", parts: [ChatPartModel(text: event.inputMessage)]));

    emit(ChatSuccessState(messages: messages));
    gen = true;

    // Generate response
    String generatedText = await ChatRepo.chatTextGenerationRepo(messages);

    // Process and add generated message
    if (generatedText.isNotEmpty) {
      generatedText = _parseText(generatedText); // Remove formatting characters
      messages.add(ChatMessageModel(
          role: "model", parts: [ChatPartModel(text: generatedText)]));
      emit(ChatSuccessState(messages: messages));
    }

    gen = false;
  }

  String _parseText(String text) {
    // Remove formatting characters
    return text.replaceAll('*', '');
  }
}
