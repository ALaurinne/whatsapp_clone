import 'package:flutter/material.dart';
import 'package:new_project/models/StoryListItem.dart';
import 'package:new_project/screens/StoryViewScreen.dart';

class StatusTab extends StatelessWidget {

  final List<StoryListItem> storyListItems = [

    StoryListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t1.0-9/s960x960/35362299_1778569952198755_4120467782695387136_o.jpg?_nc_cat=111&_nc_sid=7aed08&_nc_ohc=099e0g1jnGgAX9RG1fL&_nc_ht=scontent.fssa7-1.fna&_nc_tp=7&oh=6be3aae5cdcead4cfdec9c4318e56a1b&oe=5F09BCE0",
      personName: "Laurinne",
      date: "15:00",
    ),
    StoryListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t31.0-8/s960x960/14067822_1093847150671042_5073446049279310352_o.jpg?_nc_cat=103&_nc_sid=7aed08&_nc_ohc=GddwKZkWHwkAX-IZRCe&_nc_ht=scontent.fssa7-1.fna&_nc_tp=7&oh=ee95cfa3560929b2e81c6131e99b547e&oe=5F07CF7A",
      personName: "Lau",
      date: "15:00",

    ),
    StoryListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t31.0-8/p720x720/1898863_629202940468801_580628259_o.jpg?_nc_cat=103&_nc_sid=7aed08&_nc_ohc=G2EFtDPDkhgAX8ZOUgg&_nc_ht=scontent.fssa7-1.fna&_nc_tp=6&oh=bb54a2f23124d3dc048168357f5d554c&oe=5F07B7BA",
      personName: "Oliver",
      date: "15:00",
    ),
    StoryListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t1.0-9/1390664_574299812625781_1675278015_n.jpg?_nc_cat=106&_nc_sid=7aed08&_nc_ohc=Ov48Gn-WxyQAX8SNOfu&_nc_ht=scontent.fssa7-1.fna&oh=102d48ec806604a84894c16ff43594b5&oe=5F0A2BB2",
      personName: "Laau Oliveira",
      date: "15:00",
    ),
  ];

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
