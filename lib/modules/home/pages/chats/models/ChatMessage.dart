import 'package:mobx/mobx.dart';
part 'ChatMessage.g.dart';

class ChatMessage = _ChatMessageBase with _$ChatMessage;

abstract class _ChatMessageBase with Store {
  final String message;
  final bool isSentByMe;
  final String date;

  _ChatMessageBase({
    this.message,
    this.date = "16:00",
    this.isSentByMe = true,
  });
}
