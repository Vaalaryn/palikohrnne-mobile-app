import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/config/Constante.dart';
import 'package:palikorne/app/view/RessourceView.dart';

class ListResourceView extends StatefulWidget {
  createState() => ListResourceViewState();
}

class ListResourceViewState extends State<ListResourceView> {
  List item = [];

  @override
  void initState() {
    fetchRessources();
    super.initState();
  }

  void fetchRessources() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/ressources"), headers: {'Content-type': 'application/json'});
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {
        item = jsonDecode(response.body)['data'];
      });
      } else {
      throw Exception('Failed to load post');
    }
  }

  Widget getSubtitle(int vue, int vote, int com){
    return Container(
      margin: EdgeInsets.only(top: 2),
        child:Row(children: [
      Icon(Icons.people, size: 13,),
      Container(margin: EdgeInsets.all(1.5)),
      Text(vue.toString(), style: TextStyle(fontSize: 12)),
      Container(margin: EdgeInsets.all(4.0)),
      Icon(Icons.how_to_vote, size: 13),
      Container(margin: EdgeInsets.all(1.5)),
      Text(vote.toString(), style: TextStyle(fontSize: 12)),
      Container(margin: EdgeInsets.all(4.0)),
      Icon(Icons.comment, size: 13),
      Container(margin: EdgeInsets.all(1.5)),
      Text(com.toString(), style: TextStyle(fontSize: 12)),
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: (){},),
      body: ListView.builder(

        itemCount: item.length,
        itemBuilder: (BuildContext context2, int index){
          return ListTile(
              title: Text(item[index]['Titre'], style: TextStyle(fontSize: 17)),
              subtitle: getSubtitle(item[index]['Vues'], item[index]['Votes'], item[index]['Commentaires'].length),
              trailing: Text('time'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => RessourceView(item[index]["ID"].toString())));
              });
        },
        ),
    );
  }
}