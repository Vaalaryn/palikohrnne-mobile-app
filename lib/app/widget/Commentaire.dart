import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:palikorne/app/helper/RessourceHelper.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/config/Constante.dart';

class Commentaire extends StatefulWidget {
  dynamic _data;

  Commentaire(this._data);

  @override
  createState() => _CommentaireState(this._data);
}

class _CommentaireState extends State<Commentaire> {
  bool isFav = false;
  dynamic _data = null;

  _CommentaireState(this._data);

  Future<dynamic> getRessourceData() async {
    final response = await get(
        Uri.http(Constante.baseApiUrl, "/api/commentaires/${_data["ID"]}"),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer ' + User.Token
        });
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body)['data'];
      });
    } else {
      throw Exception('Failed to load ressource');
    }
  }

  @override
  Widget build(BuildContext context) {
    isFav = _data["CitoyenVoted"].where((item) => item["ID"] == User.Id).toList().length > 0 ;
    return Container(
      padding: EdgeInsets.all(0),
      child: ListTile(
        horizontalTitleGap: 10,
          title: Text(_data["Contenu"], style: TextStyle(fontSize: 18)),
          subtitle: Text(_data["Citoyen"]["Pseudo"] +
              " - " +
              ResourceHelper.getTimePassedFromDate(_data["CreatedAt"], context), style: TextStyle(fontSize: 14)),
          leading: Container(
              child: Column(
                  children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: isFav ? Colors.redAccent : Colors.grey,
                        size: 22,
                      ),
                      onPressed: () async {
                        Object data = {
                          "CommentaireID": _data["ID"],
                          "CitoyenID":   User.Id,
                        };
                        var response;
                        if(!isFav) {
                          response = await post(
                              Uri.http(Constante.baseApiUrl, "/api/voteCommentaire"),
                              headers: {
                                'Content-type': 'application/json',
                                'Authorization': 'Bearer ' + User.Token
                              },
                              body: jsonEncode(data));
                        }else {
                          response = await delete(
                              Uri.http(Constante.baseApiUrl, "/api/voteCommentaire/${User.Id}/${_data["ID"]}"),
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
                ),
                Container(
                  child: Text(
                    _data["CitoyenVoted"].length.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ]))),
    );
  }
}
