import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/modules/home/HomeController.dart';
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
  final controller = HomeController();
  String text;

  void initState() {
    // primeria coisa que roda
    print("init");
    super.initState();
  }

  void dispose() {
    // ao finalizar o widget
    // Clean up the controller when the widget is disposed.
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Observer(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: controller.isSearching
                  ? AppBarSearch(
                      searchChat: controller.searchChat,
                      onSearchChange: controller.setTextSearch,
                      onClear: () {
                        controller.setTextSearch('');
                      },
                    )
                  : AppBarTitle(),
              backgroundColor: primaryColor,
              bottom: controller.isSearching
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
              actions: !controller.isSearching
                  ? <Widget>[
                      IconButton(
                        onPressed: controller.searchChat,
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
                ChatsPage(text: controller.textSearch),
                StatusPage(),
                CallsPage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
