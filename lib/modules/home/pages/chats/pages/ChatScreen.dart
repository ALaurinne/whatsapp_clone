import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatListItem.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  final ChatListItem person;

  ChatScreen({this.person});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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

  TextEditingController myController;

  void initState() {
    // primeria coisa que roda
    print("init");
    super.initState();
    myController = TextEditingController();
  }

  void dispose() {
    // ao finalizar o widget
    // Clean up the controller when the widget is disposed.
    print("dispose");
    myController.dispose();
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
              child: TextField(
                controller: myController,
                decoration: InputDecoration.collapsed(
                  hintText: "Your Message Here",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          FloatingActionButton(
              mini: true,
              backgroundColor: primaryColor,
              onPressed: sendMessage,
              child: Icon(
                Icons.send,
              ))
        ],
      ),
    );
  }

  sendMessage() {
    setState(() {
      messages.add(ChatMessage(
        isSentByMe: true,
        message: myController.text,
      ));
      myController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatBackgroundColor,
      appBar: AppBar(
        leading: ChatLeading(profileUrl: widget.person.profileUrl),
        title: Text(widget.person.personName),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
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
              itemCount: messages.length,
              itemBuilder: (ctx, i) => renderChatMessage(messages[i]),
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
