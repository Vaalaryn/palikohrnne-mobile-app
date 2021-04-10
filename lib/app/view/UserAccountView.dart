import 'package:flutter/material.dart';
import 'package:palikorne/app/model/User.dart';

class UserAccountView extends StatefulWidget {
  createState() => UserAccountViewState();
}

class UserAccountViewState extends State<UserAccountView> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListTile(
          title: Text(User.Nom + " " + User.Prenom),
          subtitle: Text(User.Pseudo),
          trailing: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                  "...",
                  style: TextStyle(
                      fontSize: 25, color: Colors.white)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              right: -40.0,
                              top: -40.0,
                              child: InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  child: Icon(Icons.close),
                                  backgroundColor: Colors.red,
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        labelText:"Prénom",),
                                      initialValue: User.Prenom,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText:"Nom",),
                                        initialValue: User.Nom,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText:"Pseudo",),
                                        initialValue: User.Pseudo,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text("Yolo !"),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                        }
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              ),
      ),
      ListTile(
          subtitle: Text(User.Adresse + ", " + User.CodePostal + " " + User.Ville),
          title: Text("Adresse"),
          trailing: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
                "...",
                style: TextStyle(
                    fontSize: 25, color: Colors.white)),
            onPressed: () {}
        ),
      ),
      ListTile(
          title: Text("Téléphone"),
          subtitle: Text(User.Telephone),
          trailing: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
                "...",
                style: TextStyle(
                    fontSize: 25, color: Colors.white)),
            onPressed: () {}
        ),
      ),
      ListTile(
          title: Text("Mail"),
          subtitle: Text(User.Mail),
          trailing: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
                "...",
                style: TextStyle(
                    fontSize: 25, color: Colors.white)),
            onPressed: () {}
        ),
      ),
      ListTile(
          title: Text("Genre"),
          subtitle: Text(User.Genre),
          trailing: RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
                "...",
                style: TextStyle(
                    fontSize: 25, color: Colors.white)),
            onPressed: () {}
        ),
      ),
      ElevatedButton(onPressed: () {}, child: Text("Changer le mot de passe")),
      ElevatedButton(onPressed: () {}, child: Text("Deconnexion"))
    ],);
  }
}