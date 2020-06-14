import 'package:flutter/material.dart';
import 'package:new_project/models/ChatListItem.dart';
import 'package:new_project/screens/StoryViewScreen.dart';

class StatusTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatListItems.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(chatListItems[i].personName),
          subtitle: Text(chatListItems[i].date),
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
                builder: (context) => StoryViewScreen(),
              ),
            );
          },
        );
      },
      separatorBuilder: (ctx, i) {
        return Divider(
          height: 1,
          indent: 15,
          endIndent: 15,
        );
      },
    );
  }
}
