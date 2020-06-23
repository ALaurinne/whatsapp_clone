
import 'package:new_project/modules/home/pages/chats/models/ChatMessage.dart';

class ChatScreenController{

final List<ChatMessage> messages = [
    ChatMessage(isSentByMe: false, message: "Oláaa"),
    ChatMessage(isSentByMe: true, message: "Oi oi"),
    ChatMessage(isSentByMe: false, message: "Como cê tá?"),
    ChatMessage(isSentByMe: true, message: "Vivendo ou sobrevivendo"),
    ChatMessage(isSentByMe: true, message: "e vc?"),
    ChatMessage(isSentByMe: false, message: "to beeem"),
    ChatMessage(isSentByMe: false, message: "Oláaa"),
    ChatMessage(isSentByMe: true, message: "Oi oi"),
    ChatMessage(isSentByMe: false, message: "Como cê tá?"),
    ChatMessage(isSentByMe: true, message: "Vivendo ou sobrevivendo"),
    ChatMessage(isSentByMe: true, message: "e vc?"),
    ChatMessage(isSentByMe: false, message: "to beeem"),
    ChatMessage(isSentByMe: false, message: "Oláaa"),
    ChatMessage(isSentByMe: true, message: "Oi oi"),
    ChatMessage(isSentByMe: false, message: "Como cê tá?"),
    ChatMessage(isSentByMe: true, message: "Vivendo ou sobrevivendo"),
    ChatMessage(isSentByMe: true, message: "e vc?"),
    ChatMessage(isSentByMe: false, message: "Vai dar certo"),
  ];

  sendMessage(
    String message,
  ){
    messages.add(ChatMessage(
      isSentByMe: true,
      message: message,
    ));
  }
}