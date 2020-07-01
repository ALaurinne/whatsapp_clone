import 'package:mobx/mobx.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatMessage.dart';
part 'ChatScreenController.g.dart';

class ChatScreenController = ChatScreenControllerBase
    with _$ChatScreenController;

abstract class ChatScreenControllerBase with Store {
  // @observable
  // String counter = '';

  // @action
  // increment(String newMessage){
  //   counter = newMessage;
  // }

  @observable
  bool isTyping = false;

  @action
  changeTyping(bool value) => isTyping = value;

  @observable
  ObservableList<ChatMessage> messages = [
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
  ].asObservable();

  @action
  sendMessage(String message) {
    messages.add(ChatMessage(message: message));
  }
}
