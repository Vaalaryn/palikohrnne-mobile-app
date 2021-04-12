import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/helper/RessourceHelper.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/app/widget/LineBreak.dart';
import 'package:palikorne/config/Constante.dart';

class SingleValidation extends StatefulWidget {
  final String id;

  SingleValidation(this.id);

  @override
  createState() => _SingleValidationState(this.id);
}

class _SingleValidationState extends State<SingleValidation> {
  final String _id;
  bool isFav = false;
  dynamic _data = null;
  String contenu = "";

  _SingleValidationState(this._id);

  Future<dynamic> getRessourceData() async {
    final response = await get(
        Uri.http(Constante.baseApiUrl, "/ressources/" + _id),
        headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load ressource');
    }
  }

  List<Widget> buildTag() {
    List<Widget> tags = [];
    for (dynamic tag in _data["Tags"]) {
      tags.add(
        Container(
            margin: EdgeInsets.all(3.0),
            child: Chip(
                label: Text(tag["Nom"]),
                backgroundColor: Theme.of(context).primaryColor)),
      );
    }
    return tags;
  }

  @override
  void initState() {
    getRessourceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isFav = _data["CitoyenVoted"]
            .where((item) => item["ID"] == User.Id && item["DeletedAt"] != null)
            .toList()
            .length >
        0;
    return (_data != null)
        ? Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      final response = await patch(
                          Uri.http(Constante.baseApiUrl,
                              "/api/ressources/${_data["ID"]}"),
                          headers: {
                            'Content-type': 'application/json',
                            'Authorization': 'Bearer ' + User.Token
                          },
                          body: jsonEncode({"ValidationAdmin": true}));
                      if (response.statusCode == 200) {
                        Navigator.of(context).pop();
                      }
                    }),
                IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () async {
                      final response = await delete(
                          Uri.http(Constante.baseApiUrl,
                              "/api/ressources/${_data["ID"]}"),
                          headers: {
                            'Content-type': 'application/json',
                            'Authorization': 'Bearer ' + User.Token
                          });
                      if (response.statusCode == 200) {
                        Navigator.of(context).pop();
                      }
                    }),
              ],
              bottom: PreferredSize(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    height: 4.0,
                  ),
                  preferredSize: Size.fromHeight(4.0)),
            ),
            body: Container(
                padding: EdgeInsets.all(10.0),
                child: ListView(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03),
                    child: Text(
                      _data["Titre"],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      "Message",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    child: Text(
                      _data["Contenu"],
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  LineBreak(),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(_data["Citoyen"]["Pseudo"]),
                              Text(_data["Citoyen"]["Nom"] +
                                  " " +
                                  _data["Citoyen"]["Prenom"]),
                              Text(ResourceHelper.getTimePassedFromDate(
                                  _data["CreatedAt"], context))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  LineBreak(),
                  Container(
                    child: Text(
                      "Tags",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: buildTag(),
                    ),
                  ),
                ])))
        : Container();
  }
}
