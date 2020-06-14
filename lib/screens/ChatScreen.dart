import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/models/ChatListItem.dart';
import 'package:new_project/models/ChatMessage.dart';

class ChatScreen extends StatelessWidget {
  final ChatListItem person;

  ChatScreen({this.person});

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
              color: Color(0xFFDCF8C6),
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
              onPressed: () {},
              child: Icon(
                Icons.send,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatBackgroundColor,
      appBar: AppBar(
        // leading: CircleAvatar(
        //     backgroundColor: Colors.grey,
        //     backgroundImage: NetworkImage(
        //       person.profileUrl
        //     ),
        // ),
        title: Text(person.personName),
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
