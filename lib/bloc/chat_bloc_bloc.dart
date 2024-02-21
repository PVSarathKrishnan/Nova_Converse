import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_guide/models/chat_message_model.dart';
import 'package:code_guide/repositories/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  ChatBloc() : super(ChatBlocInitial()) {
    on<ChatGenerateNewTextMessageEvent>(chatGenerateNewTextMessageEvent);
  }
  List<ChatMessageModel> messages = [];

  Future<FutureOr<void>> chatGenerateNewTextMessageEvent(
      ChatGenerateNewTextMessageEvent event,
      Emitter<ChatBlocState> emit) async {
    messages.add(ChatMessageModel(
        Role: "user", parts: [ChartPartModel(text: event.inputMessage)]));

    emit(ChatSuccessState(messages: messages));

    await ChatRepo.chatTextGenerationRepo(messages);
  }
}
