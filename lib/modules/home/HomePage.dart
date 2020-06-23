import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/calls/CallsPage.dart';
import 'package:new_project/modules/home/pages/camera/CameraPage.dart';
import 'package:new_project/modules/home/pages/chats/ChatsPage.dart';
import 'package:new_project/modules/home/pages/story/StatusPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
            CameraPage(),
            ChatsPage(),
            StatusPage(),
            CallsPage(),
          ],
        ),
      ),
    );
  }
}
