import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/config/Constante.dart';
import 'package:palikorne/generated/l10n.dart';

class NewRessource extends StatefulWidget {
  @override
  createState() => _NewRessourceState();
}

class _NewRessourceState extends State<NewRessource> {
  String contenu = "";
  String titre = "";

  List<dynamic> listTag = [];
  List<String> listTagId = [];
  String tagValue = null;

  List<dynamic> listTypeRelation = [];
  String typeRelationValue = null;

  List<dynamic> listCat = [];
  String catValue = null;

  List<dynamic> listTypeRessource = [];
  String typeRessourceValue = null;

  @override
  void initState() {
    super.initState();
    getTag();
    getCategorie();
    getTypeRelation();
    getTypeRessource();
  }

  void getTag() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/tags"),
        headers: {'Content-type': 'application/json'});
    setState(() {
      listTag = jsonDecode(response.body)["data"];
    });
  }

  void getCategorie() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/categories"),
        headers: {'Content-type': 'application/json'});
    setState(() {
      listCat = jsonDecode(response.body)["data"];
    });
  }

  void getTypeRelation() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/typeRelations"),
        headers: {'Content-type': 'application/json'});
    setState(() {
      listTypeRelation = jsonDecode(response.body)["data"];
    });
  }

  void getTypeRessource() async {
    final response = await get(
        Uri.http(Constante.baseApiUrl, "/typeRessources"),
        headers: {'Content-type': 'application/json'});
    setState(() {
      debugPrint("test");
      listTypeRessource = jsonDecode(response.body)["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout d'une Ressource"),
        backgroundColor: Theme.of(context).primaryColor,
        bottom: PreferredSize(
            child: Container(
              color: Theme.of(context).accentColor,
              height: 4.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(labelText: "Titre"),
                onChanged: (value) {
                  titre = value;
                }),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
                maxLines: 10,
                minLines: 2,
                decoration: InputDecoration(labelText: "Contenu"),
                onChanged: (value) {
                  contenu = value;
                }),
          ),
          ListTile(
            title: Text("Categorie"),
            trailing: DropdownButton(
              value: catValue,
              items: listCat
                  .map((tag) => DropdownMenuItem(
                      value: tag["Categorie"]["ID"].toString(),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(tag["Categorie"]["Nom"]),
                      )))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  catValue = item;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Type de relation"),
            trailing: DropdownButton(
              value: typeRelationValue,
              items: listTypeRelation
                  .map((tag) => DropdownMenuItem(
                      value: tag["ID"].toString(),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(tag["Nom"]),
                      )))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  typeRelationValue = item;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Type de ressource"),
            trailing: DropdownButton(
              value: typeRessourceValue,
              items: listTypeRessource
                  .map((tag) => DropdownMenuItem(
                      value: tag["ID"].toString(),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(tag["Nom"]),
                      )))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  typeRessourceValue = item;
                });
              },
            ),
          ),
          ListTile(
              title: Text("Tag"),
              subtitle: Row(
                  children: listTagId
                      .map((id) => Chip(
                          label: Text(listTag.firstWhere((element) =>
                              element["ID"].toString() == id)["Nom"])))
                      .toList()),
              trailing: DropdownButton(
                value: null,
                items: listTag
                    .map((tag) => DropdownMenuItem(
                        value: tag["ID"].toString(),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(tag["Nom"]),
                        )))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    tagValue = item;
                    listTagId.add(item);
                  });
                },
              )),
          FlatButton(
              color: Theme.of(context).primaryColor,
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(S.of(context).profilSaveModifications,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    trailing:
                        Icon(Icons.exit_to_app, color: Colors.white, size: 40),
                  )),
              onPressed: () async {
                Object data = {
                  "Titre": titre,
                  "Contenu": contenu,
                  "CitoyenID": User.Id,
                  "TypeRelationID": int.parse(typeRelationValue),
                  "TypeRessourceID": int.parse(typeRessourceValue),
                  "CategorieID": int.parse(catValue),
                };
                final response = await post(
                    Uri.http(Constante.baseApiUrl, "/api/ressources"),
                    headers: {
                      'Content-type': 'application/json',
                      'Authorization': 'Bearer ' + User.Token
                    }, body: jsonEncode(data));
                if(response.statusCode == 200){
                  Navigator.pop(context);
                }
              }),
        ],
      ),
    );
  }
}
