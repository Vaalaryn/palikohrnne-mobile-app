import 'package:flutter/material.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/generated/l10n.dart';
import 'package:palikorne/config/Constante.dart';

class UserAccountView extends StatefulWidget {
  UserAccountViewState createState() => UserAccountViewState();
}

class UserAccountViewState extends State<UserAccountView>  {
  final _formKey = GlobalKey<FormState>();
  final List<String> _genreChoices = ['M', 'F', 'N'].toList();
  String _selectedChoice;
  String Mail;
  String userName;
  String lastName;
  String firstName;
  String phoneNumber;
  String address;
  String zipCode;
  String city;

  @override
  void initState() {
    super.initState();
    //_selectedChoice = User.Genre;
  }

  @override
  Widget build(BuildContext context) {
    final dropdownMenuGenreOptions = _genreChoices
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item))
            ).toList();
    print(_selectedChoice);
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
                                        labelText: S.of(context).profilFirstName,),
                                      initialValue: User.Prenom,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S.of(context).profilLastName,),
                                        initialValue: User.Nom,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S.of(context).profilUserName,),
                                        initialValue: User.Pseudo,
                                        validator: (value) {
                                  if (value.isEmpty) {
                                  return S.of(context).inscriptionMsgFieldsEmpty;
                                  }
                                  RegExp regExp = new RegExp(Constante.regexUsername,
                                  caseSensitive: false, multiLine: false);
                                  if (regExp.hasMatch(value)) {
                                  this.userName = value;
                                  } else {
                                  return S.of(context).inscriptionMsgWrongMail;
                                  }
                                  return null;
                                  },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RaisedButton(
                                      child: Text(S.of(context).profilSaveModifications),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          Navigator.of(context).pop();
                                          // TODO : update user via api
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
                                      labelText: S.of(context).profilAddress,),
                                    initialValue: User.Adresse,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: S.of(context).profilZipCode,),
                                    initialValue: User.CodePostal,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: S.of(context).profilCity,),
                                    initialValue: User.Ville,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text(S.of(context).profilSaveModifications),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        Navigator.of(context).pop();
                                        // TODO : update user via api
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
          title: Text("Téléphone"),
          subtitle: Text(User.Telephone),
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
                                      labelText: S.of(context).profilPhoneNumber,),
                                    initialValue: User.Telephone,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text(S.of(context).profilSaveModifications),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        Navigator.of(context).pop();
                                        // TODO : update user via api
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
          title: Text("Mail"),
          subtitle: Text(User.Mail),
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
                                      labelText: S.of(context).profilMail,),
                                    initialValue: User.Mail,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return S.of(context).inscriptionMsgFieldsEmpty;
                                      }
                                      RegExp regExp = new RegExp(Constante.regexMail,
                                          caseSensitive: false, multiLine: false);
                                      if (regExp.hasMatch(value)) {
                                        this.Mail = value;
                                      } else {
                                        return S.of(context).inscriptionMsgWrongMail;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text(S.of(context).profilSaveModifications),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        Navigator.of(context).pop();
                                        // TODO : update user via api
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
          title: Text("Genre"),
          subtitle: Text(User.Genre),
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
                                  child: Column(
                                      children: <Widget>[
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                              Text(S.of(context).profilGenre),
                                              Container(width: 8),
                                              DropdownButton<String>(
                                                  items: dropdownMenuGenreOptions,
                                                  onChanged: (String newValue) {
                                                      setState(() {
                                                          _selectedChoice = newValue;
                                                      });
                                                  },
                                                  value: _selectedChoice,
                                              ),
                                          ]),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RaisedButton(
                                    child: Text(S.of(context).profilSaveModifications),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();
                                        Navigator.of(context).pop();
                                        // TODO : update user via api
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
      ElevatedButton(onPressed: () {}, child: Text("Changer le mot de passe")),
      ElevatedButton(onPressed: () {}, child: Text("Deconnexion"))
    ],);
  }
}