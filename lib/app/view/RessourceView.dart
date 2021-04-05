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

  _RessourceViewState(this._id);

  Future<dynamic> getRessourceData() async {
    final response = await get(Uri.http(Constante.baseApiUrl, "/ressources/" + _id), headers: {'Content-type': 'application/json'});
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load ressource');
    }
  }

  List<Widget> buildComentaire(){
    List<Widget> commentaire = [Text("Test"), Text("Test")];
    return commentaire;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getRessourceData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(child: Container(color:  Theme.of(context).primaryColor, height: 4.0,), preferredSize: Size.fromHeight(4.0)),
            ),
            body: ListView(children: [
              Text("Titre"),
              Row(children: [
                Text("Publié"),
                Text("Dernoere activite"),
                Text("Vues")
              ]),
              Row(children: [
                Column(children: [
                  Icon(Icons.favorite),
                  Text("100")
                ]),
                Column(
                  children: [
                    Text("Ceci est le contenu "),
                    Row(children: [Chip(label: Text("Test"))])
                  ])]),
              Text("Nombre de réponse"),
              ...buildComentaire()
            ])
          );
        });
  }
}
