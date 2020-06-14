import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/models/ChatListItem.dart';

class CallsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatListItems.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(chatListItems[i].personName),
          subtitle: Text(chatListItems[i].lastMessage),
          trailing: IconButton(
            onPressed: (){},
            icon: Icon(
              i%3!=0 ? Icons.call : Icons.videocam,
              color: primaryColor,
              ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              chatListItems[i].profileUrl,
            ),
          ),
          onTap: () {},
        );
      },
      separatorBuilder: (ctx, i) {
        return Divider();
      },
    );
  }
}