import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/helper/RessourceHelper.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/app/widget/Commentaire.dart';
import 'package:palikorne/app/widget/LineBreak.dart';
import 'package:palikorne/config/Constante.dart';
import 'package:palikorne/generated/l10n.dart';

class RessourceView extends StatefulWidget {
  final String id;

  RessourceView(this.id);

  @override
  createState() => _RessourceViewState(this.id);
}

class _RessourceViewState extends State<RessourceView> {
  final String _id;
  bool isFav = false;
  dynamic _data = null;
  String contenu = "";

  _RessourceViewState(this._id);

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

  // TODO mise en forme de commentaires
  List<Widget> buildComentaire() {
    List<Widget> commentaires = [];
    for (dynamic commentaire in _data["Commentaires"]) {
      commentaires.add(Commentaire(commentaire));
    }
    return commentaires;
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
    isFav = _data["CitoyenVoted"].where((item) => item["ID"] == User.Id).toList().length > 0 ;
    return (_data != null)
        ? Scaffold(
            appBar: AppBar(
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFav
                                          ? Colors.redAccent
                                          : Colors.grey),
                                  onPressed: () async {
                                    Object data = {
                                      "RessourceID": int.parse(_id),
                                      "CitoyenID":   User.Id,
                                    };
                                    var response;
                                    if(!isFav) {
                                    response = await post(
                                        Uri.http(Constante.baseApiUrl, "/api/voteRessources"),
                                        headers: {
                                          'Content-type': 'application/json',
                                          'Authorization': 'Bearer ' + User.Token
                                        },
                                        body: jsonEncode(data));
                                    }else {
                                      response = await delete(
                                          Uri.http(Constante.baseApiUrl, "/api/voteRessources/${User.Id}/${_id}"),
                                          headers: {
                                            'Content-type': 'application/json',
                                            'Authorization': 'Bearer ' + User.Token
                                          });
                                    }
                                    if (response.statusCode ==
                                        200) {
                                      getRessourceData();
                                      setState(() {
                                        isFav = !isFav;
                                      });
                                    }
                                  }),
                              Text(
                                _data["Votes"].toString(),
                                style: TextStyle(fontSize: 12),
                              )
                            ]),
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
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Réponses",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            IconButton(
                                icon: Icon(Icons.comment,
                                    color: Theme.of(context).primaryColor),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            content: Stack(
                                              children: [
                                                Text("Ajout d'un commentaire",
                                                    style: TextStyle(
                                                        fontSize: 18)),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 20),
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      contenu = value;
                                                    },
                                                      maxLines: 10,
                                                      minLines: 2),
                                                )
                                              ],
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                  child: Text("Annuler"),
                                                  onPressed: () => Navigator.pop(context)),
                                              FlatButton(
                                                  child: Text(S
                                                      .of(context)
                                                      .connexionCloseError),
                                                  onPressed: () async {
                                                    Object data = {
                                                      "Contenu": contenu,
                                                      "RessourceID": int.parse(_id),
                                                      "ParentID":    null,
                                                      "CitoyenID":   User.Id,
                                                    };
                                                    final response = await post(
                                                        Uri.http(Constante.baseApiUrl, "/api/commentaires"),
                                                        headers: {
                                                          'Content-type': 'application/json',
                                                          'Authorization': 'Bearer ' + User.Token
                                                        },
                                                        body: jsonEncode(data));
                                                    if (response.statusCode ==
                                                        200) {
                                                      getRessourceData();
                                                      Navigator.pop(context);
                                                    }
                                                  })
                                            ],
                                          ));
                                }),
                          ])),
                  ...buildComentaire()
                ])))
        : Container();
  }
}
