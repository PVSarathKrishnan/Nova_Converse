import 'package:code_guide/models/chat_message_model.dart';
import 'package:code_guide/utils/constants.dart';
import 'package:dio/dio.dart';

class CodeRepo {
  static chatTextGenerationRepo(List<ChatMessageModel> previousMessages) async {
    Dio dio = Dio();

    final response = dio.post(
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=$apiKey");
  }
}
