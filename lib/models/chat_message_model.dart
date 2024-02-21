class ChatMessageModel {
  final String Role;

  final List<ChartPartModel> parts;

  ChatMessageModel({required this.Role, required this.parts});
}

class ChartPartModel {
  final String text;

  ChartPartModel({required this.text});
}
