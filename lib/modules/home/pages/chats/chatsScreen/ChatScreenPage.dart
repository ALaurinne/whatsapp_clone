import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/chatsScreen/ChatScreenController.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatListItem.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  final ChatListItem person;

  ChatScreen({this.person});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  final controller = ChatScreenController();
  TextEditingController textFieldController;

  void initState() {
    // primeria coisa que roda
    print("init");
    super.initState();
    textFieldController = TextEditingController();
  }

  void dispose() {
    // ao finalizar o widget
    // Clean up the controller when the widget is disposed.
    print("dispose");
    textFieldController.dispose();
    super.dispose();
  }

  Widget renderChatMessage(ChatMessage message) {
    return Column(
      children: <Widget>[
        Align(
          alignment:
              message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: message.isSentByMe ? Color(0xFFDCF8C6) : Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Color(0x220000000),
                  offset: Offset(1, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              message.message,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderTextBox() {
    

    return Container(
      margin: EdgeInsets.only(
        bottom: 20,
        left: 10,
        right: 10,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              color: Colors.white,
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration(
                  hintText: "Your Message Here",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.tag_faces,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ),
                onChanged: (_) {
                  setState(() {isTyping = true; });
                },
              ),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(
                isTyping ? Icons.send : Icons.mic,
                color: Colors.white,
              ),
              onPressed: sendMessage,
            ),
          ),
          // FloatingActionButton(
          //     mini: true,
          //     backgroundColor: primaryColor,
          //     onPressed: sendMessage,
          //     child: Icon(
          //       Icons.send,
          //     ))
        ],
      ),
    );
  }

  sendMessage() {
    setState(() {
      controller.sendMessage(textFieldController.text);
    });
    textFieldController.text ='';
    isTyping = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatBackgroundColor,
      appBar: AppBar(
        leading: ChatLeading(profileUrl: widget.person.profileUrl),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.person.personName,
              ),
              Padding(padding: EdgeInsets.all(1)),
              Text(
                "online",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (ctx, i) =>
                  renderChatMessage(controller.messages[i]),
            ),
          ),
          Divider(),
          Container(
            child: renderTextBox(),
          ),
        ],
      ),
    );
  }
}

//Cabeçalho
class ChatLeading extends StatelessWidget {
  const ChatLeading({
    Key key,
    @required this.profileUrl,
  }) : super(key: key);

  final String profileUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // limita a área
      padding: const EdgeInsets.only(top: 8, left: 2, bottom: 8),
      child: InkWell(
        // poder criar um botão de algo que não era para ser um botão
        borderRadius: BorderRadius.all(Radius.circular(100)),
        // deixando as bordas circulares
        child: Row(
          // uma linha com conteudo
          children: <Widget>[
            Icon(
              Icons.arrow_back,
              size: 20,
            ),
            Container(
              width: 30,
              height: 30,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(profileUrl),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
