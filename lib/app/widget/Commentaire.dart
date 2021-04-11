import 'package:flutter/material.dart';
import 'package:palikorne/app/helper/RessourceHelper.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
        title: Text(_data["Contenu"]),
        subtitle: Text(_data["Citoyen"]["Pseudo"] +
            " - " +
            ResourceHelper.getTimePassedFromDate(_data["CreatedAt"], context)),
        leading: Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(children: [
              IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.redAccent : Colors.grey,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  }),
              Text(
                _data["Vote"].toString(),
                style: TextStyle(fontSize: 12),
              )
            ])));
  }
}
