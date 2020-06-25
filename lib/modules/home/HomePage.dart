import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/pages/appbar/AppBarSearch.dart';
import 'package:new_project/modules/home/pages/appbar/AppBarTitle.dart';
import 'package:new_project/modules/home/pages/calls/CallsPage.dart';
import 'package:new_project/modules/home/pages/camera/CameraPage.dart';
import 'package:new_project/modules/home/pages/chats/ChatsPage.dart';
import 'package:new_project/modules/home/pages/story/StatusPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textFieldController = TextEditingController();
  bool isSearching;
  String text;

  searchChat() {
    setState(() {
      isSearching = !isSearching;
      textFieldController.clear();
    });
  }

  onClear() {
    setState(() {
      textFieldController.clear();
    });
  }

  void initState() {
    // primeria coisa que roda
    print("init");
    super.initState();
    isSearching = false;
    textFieldController.clear();
  }

  void dispose() {
    // ao finalizar o widget
    // Clean up the controller when the widget is disposed.
    print("dispose");
    super.dispose();
    textFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: isSearching
              ? AppBarSearch(
                  searchChat: searchChat,
                  onSearchChange: (text) {
                    setState(() {
                      this.textFieldController.text = text;
                    });
                  },
                  onClear: onClear,
                )
              : AppBarTitle(),
          backgroundColor: primaryColor,
          bottom: isSearching
              ? null
              : TabBar(
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
          actions: !isSearching
              ? <Widget>[
                  IconButton(
                    onPressed: searchChat,
                    icon: Icon(Icons.search),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ]
              : null,
        ),
        body: TabBarView(
          children: <Widget>[
            CameraPage(),
            ChatsPage(text: textFieldController.text),
            StatusPage(),
            CallsPage(),
          ],
        ),
      ),
    );
  }
}
