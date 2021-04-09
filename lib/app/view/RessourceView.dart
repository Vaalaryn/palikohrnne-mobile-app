import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/widget/Commentaire.dart';
import 'package:palikorne/config/Constante.dart';

class RessourceView extends StatefulWidget {
  final String id;

  RessourceView(this.id);

  @override
  createState() => _RessourceViewState(this.id);
}

class _RessourceViewState extends State<RessourceView> {
  final String _id;
  dynamic _data = null;

  _RessourceViewState(this._id);

  Future<dynamic> getRessourceData() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/ressources/" + _id), headers: {'Content-type': 'application/json'});
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body)['data'];
      });
      } else {
      throw Exception('Failed to load ressource');
    }
  }


  // TODO mise en forme de commentaires
  List<Widget> buildComentaire(){
    List<Widget> commentaires = [];
    for (dynamic commentaire in _data["Commentaires"]){
      debugPrint(commentaire["Nom"]);
      Commentaire();
      commentaires.add(Chip(label: Text(commentaire["Contenu"])));
    }
    return commentaires;
  }

  List<Widget> buildTag(){
    List<Widget> tags = [];
    for (dynamic tag in _data["Tags"]){
      debugPrint(tag["Nom"]);
      tags.add(Chip(label: Text(tag["Nom"])));
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
    return (_data != null) ? Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(child: Container(color:  Theme.of(context).primaryColor, height: 4.0,), preferredSize: Size.fromHeight(4.0)),
            ),
            body: ListView(children: [
              Text(_data["Titre"]),
              Row(children: [
                Text("Publié : " + _data["CreatedAt"]),
                Text("Dernoere activite : " + _data["UpdatedAt"]),
                Text("Vues : " + _data["Vues"].toString())
              ]),
              Row(children: [
                Column(children: [
                  Icon(Icons.favorite),
                  Text(_data["Votes"].toString())
                ]),
                Column(
                  children: [
                    Text(_data["Contenu"]),
                    Row(children: buildTag())
                  ])]),
              Text("Nombre de réponse : " + _data["Commentaires"].length.toString()),
              ...buildComentaire()
            ])
          ) : Container();
  }
}
