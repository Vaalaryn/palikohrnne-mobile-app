import 'package:flutter/material.dart';

class OptionListAdmin extends StatelessWidget {
  final Widget pageToOpen;
  final String titre;

  OptionListAdmin(this.titre, this.pageToOpen);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      bottom: PreferredSize(
                          child: Container(
                            color: Theme.of(context).accentColor,
                            height: 4.0,
                          ),
                          preferredSize: Size.fromHeight(4.0)),
                    ),
                    body: pageToOpen)));
      },
      title: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Text(titre,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
      trailing: Icon(Icons.arrow_forward_sharp, size: 40),
    );
  }
}
