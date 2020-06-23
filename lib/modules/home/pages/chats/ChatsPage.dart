import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/ChatsController.dart';
import 'package:new_project/modules/home/pages/chats/chatsScreen/ChatScreenPage.dart';

class ChatsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatListItems.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(chatListItems[i].personName),
          subtitle: Text(chatListItems[i].lastMessage),
          trailing: Column(
            children: <Widget>[
              Text(
                chatListItems[i].date,
                style: chatListItems[i].notRead
                    ? TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.bold)
                    : TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                width: chatListItems[i].notRead ? 30 : 0, // gambiarra
                height: chatListItems[i].notRead ? 30 : 0, // mais gambiarra
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              chatListItems[i].profileUrl,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(person: chatListItems[i]),
              ),
            );
          
          },
        );
      },
      separatorBuilder: (ctx, i) {
        return Divider();
      },
    );
  }
}
