import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/helper/RessourceHelper.dart';
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
    List tmp_item;
    final response = await get(Uri.http(Constante.baseApiUrl, "/ressources"), headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {

      tmp_item = jsonDecode(response.body)['data'];
      debugPrint(tmp_item.length.toString());
      tmp_item.removeWhere((item) => item["ValidationAdmin"] == false);
      setState(() {
        item = tmp_item;
        debugPrint(item.length.toString());
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.more_horiz),
        onPressed: (){

        }
        ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (BuildContext context2, int index){
          index = item.length - index - 1;
          return ListTile(
              title: Text(item[index]['Titre'], style: TextStyle(fontSize: 17)),
              subtitle: getSubtitle(item[index]['Vues'], item[index]['Votes'], item[index]['Commentaires'].length),
              trailing: Text(ResourceHelper.getTimePassedFromDate(item[index]["CreatedAt"], context)),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => RessourceView(item[index]["ID"].toString())));
              });
        },
        ),
    );
  }
}
