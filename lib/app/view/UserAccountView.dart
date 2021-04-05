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
      ),
      ListTile(
          subtitle: Text(User.Adresse + ", " + User.CodePostal + " " + User.Ville),
          title: Text("Adresse"),
      ),
      ListTile(
          title: Text("Téléphone"),
          subtitle: Text(User.Telephone)
      ),
      ListTile(
          title: Text("Mail"),
          subtitle: Text(User.Mail)
      ),
      ListTile(
        title: Text("Genre"),
          subtitle: Text(User.Genre)
      ),
      ElevatedButton(onPressed: () {}, child: Text("Changer le mot de passe")),
      ElevatedButton(onPressed: () {}, child: Text("Deconnexion"))
    ],);
  }
}