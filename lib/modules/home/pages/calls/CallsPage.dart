import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/calls/CallsController.dart';

class CallsPage extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: callListItem.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(callListItem[i].personName),
          subtitle: Text(callListItem[i].date),
          trailing: IconButton(
            onPressed: (){},
            icon: Icon(
              callListItem[i].isCall ? Icons.call : Icons.videocam,
              color: primaryColor,
              ),
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              callListItem[i].profileUrl,
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