import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/tabs/CallsTab.dart';
import 'package:new_project/tabs/CameraTab.dart';
import 'package:new_project/tabs/ChatsTab.dart';
import 'package:new_project/tabs/StatusTab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: primaryColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                child: Text("CONVERSAS"),
              ),
              Tab(
                child: Text("STATUS"),
              ),
              Tab(
                child: Text("CHAMADAS"),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CameraTab(),
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.chat,
            color: Colors.white,
          ),
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
