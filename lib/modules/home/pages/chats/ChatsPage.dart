import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/ChatsController.dart';
import 'package:new_project/modules/home/pages/chats/chatsScreen/ChatScreenPage.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final controller = ChatsController();

  newChatMessage(){
    setState(() {
      controller.newChat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
        reverse: true,
        itemCount: controller.chatListItems.length,
        itemBuilder: (ctx, i) {
          return ListTile(
            title: Text(controller.chatListItems[i].personName),
            subtitle: Text(controller.chatListItems[i].lastMessage),
            trailing: Column(
              children: <Widget>[
                Text(
                  controller.chatListItems[i].date,
                  style: controller.chatListItems[i].notRead
                      ? TextStyle(
                          color: secondaryColor, fontWeight: FontWeight.bold)
                      : TextStyle(color: Colors.grey),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                Container(
                  width: controller.chatListItems[i].notRead ? 30 : 0, // gambiarra
                  height: controller.chatListItems[i].notRead ? 30 : 0, // mais gambiarra
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
                controller.chatListItems[i].profileUrl,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(person: controller.chatListItems[i]),
                ),
              );
            
            },
          );
          
        },
        separatorBuilder: (ctx, i) {
          return Divider();
        },
      ),
    floatingActionButton: FloatingActionButton(
          onPressed: newChatMessage,
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
        ),
    );
  }
}
