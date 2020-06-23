import 'package:flutter/material.dart';
import 'package:new_project/config/config.dart';
import 'package:new_project/models/CallListItem.dart';

class CallsTab extends StatelessWidget {

  final List<CallListItem> callListItem = [

    CallListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t1.0-9/82614383_2716249885097419_3396061057905590272_n.jpg?_nc_cat=110&_nc_sid=7aed08&_nc_ohc=vnnyB8GH9QAAX_PcP8I&_nc_ht=scontent.fssa7-1.fna&oh=167bc2a94c8f7809c3b2fe9980ea56aa&oe=5F08E134",
      personName: "Lauri",
      date: "15:00",
      isCall: true,
    ),

    CallListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t1.0-9/s960x960/35362299_1778569952198755_4120467782695387136_o.jpg?_nc_cat=111&_nc_sid=7aed08&_nc_ohc=099e0g1jnGgAX9RG1fL&_nc_ht=scontent.fssa7-1.fna&_nc_tp=7&oh=6be3aae5cdcead4cfdec9c4318e56a1b&oe=5F09BCE0",
      personName: "Laurinne",
      date: "15:00",
      isCall: false,
    ),
    CallListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t31.0-8/s960x960/15384461_1197935906928832_2098159937534331287_o.jpg?_nc_cat=102&_nc_sid=7aed08&_nc_ohc=OOCO7w6GbKgAX9JYYYk&_nc_ht=scontent.fssa7-1.fna&_nc_tp=7&oh=af9481ae99d4acad9293b57d915ebaa2&oe=5F099127",
      personName: "Olivinha",
      date: "15:00",
      isCall: true,
    ),
    CallListItem( 
      profileUrl: "https://scontent.fssa7-1.fna.fbcdn.net/v/t1.0-9/1390664_574299812625781_1675278015_n.jpg?_nc_cat=106&_nc_sid=7aed08&_nc_ohc=Ov48Gn-WxyQAX8SNOfu&_nc_ht=scontent.fssa7-1.fna&oh=102d48ec806604a84894c16ff43594b5&oe=5F0A2BB2",
      personName: "Laau Oliveira",
      date: "15:00",
      isCall: true,
    ),
  ];
  
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