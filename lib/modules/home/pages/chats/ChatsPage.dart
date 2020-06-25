import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/chats/ChatsController.dart';
import 'package:new_project/modules/home/pages/chats/chatsScreen/ChatScreenPage.dart';

class ChatsPage extends StatefulWidget {
  final String text;

  const ChatsPage({Key key, this.text}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final controller = ChatsController();

  newChatMessage() {
    setState(() {
      controller.newChat();
    });
  }

  void initState() {
    // primeria coisa que roda
    super.initState();
  }

  void dispose() {
    // ao finalizar o widget
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatsListView(controller: controller, widget: widget),
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
  const ChatsListView({
    Key key,
    @required this.controller,
    @required this.widget,
  }) : super(key: key);

  final ChatsController controller;
  final ChatsPage widget;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount:  controller.buildSearchList(widget.text).length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text( controller.buildSearchList(widget.text)[i].personName),
          subtitle: Text( controller.buildSearchList(widget.text)[i].lastMessage),
          trailing: Column(
            children: <Widget>[
              Text(
                 controller.buildSearchList(widget.text)[i].date,
                style:  controller.buildSearchList(widget.text)[i].notRead
                    ? TextStyle(
                        color: secondaryColor, fontWeight: FontWeight.bold)
                    : TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                width:
                     controller.buildSearchList(widget.text)[i].notRead ? 30 : 0, // gambiarra
                height:  controller.buildSearchList(widget.text)[i].notRead
                    ? 30
                    : 0, // mais gambiarra
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
               controller.buildSearchList(widget.text)[i].profileUrl,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ChatScreen(person:  controller.buildSearchList(widget.text)[i]),
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
