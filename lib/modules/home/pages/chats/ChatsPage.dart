import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/ChatsController.dart';
import 'package:new_project/modules/home/pages/chats/chatsScreen/ChatScreenPage.dart';
import 'package:new_project/modules/home/pages/chats/models/ChatListItem.dart';

class ChatsPage extends StatefulWidget {
  final String text;

  const ChatsPage({Key key, this.text}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final controller = ChatsController();

  newChatMessage() {
    controller.newChat();
  }

  // void initState() {
  //   // primeria coisa que roda
  //   super.initState();
  // }

  // void dispose() {
  //   // ao finalizar o widget
  //   // Clean up the controller when the widget is disposed.
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // Alterando filtro
    controller.setFilter(widget.text);

    return Scaffold(
      body: Observer(
        builder: (_) {
          return ChatsListView(
            list: controller.listFiltered,
          );
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

class ChatsListView extends StatelessWidget {
  const ChatsListView({Key key, this.list}) : super(key: key);

  final List<ChatListItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(list[i].personName),
          subtitle: Text(list[i].lastMessage),
          trailing: Column(
            children: <Widget>[
              Text(
                list[i].date,
                style: list[i].notRead
                    ? TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.bold)
                    : TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                width: list[i].notRead ? 30 : 0, // gambiarra
                height: list[i].notRead ? 30 : 0, // mais gambiarra
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
              list[i].profileUrl,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(person: list[i]),
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
