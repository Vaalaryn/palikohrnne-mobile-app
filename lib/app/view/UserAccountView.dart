import 'package:flutter/material.dart';
import 'package:palikorne/app/model/User.dart';

class UserAccountView extends StatefulWidget {
  createState() => UserAccountViewState();
}

class UserAccountViewState extends State<UserAccountView> {
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
              onPressed: () {}
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