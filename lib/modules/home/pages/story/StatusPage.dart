import 'package:flutter/material.dart';
import 'package:new_project/modules/home/pages/story/StatusController.dart';
import 'package:new_project/modules/home/pages/story/pages/StoryViewScreen.dart';

class StatusPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: storyListItems.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(storyListItems[i].personName),
          subtitle: Text(storyListItems[i].date),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              storyListItems[i].profileUrl,
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
