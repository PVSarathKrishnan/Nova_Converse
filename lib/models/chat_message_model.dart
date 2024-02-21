// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatMessageModel {
  final String Role;

  final List<ChartPartModel> parts;

  ChatMessageModel({required this.Role, required this.parts});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Role': Role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      Role: map['Role'] as String,
      parts: List<ChartPartModel>.from((map['parts'] as List<int>).map<ChartPartModel>((x) => ChartPartModel.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageModel.fromJson(String source) => ChatMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ChartPartModel {
  final String text;

  ChartPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }

  factory ChartPartModel.fromMap(Map<String, dynamic> map) {
    return ChartPartModel(
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChartPartModel.fromJson(String source) => ChartPartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
