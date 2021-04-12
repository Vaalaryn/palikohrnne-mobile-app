import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:palikorne/app/model/User.dart';
import 'package:palikorne/app/view/AppView.dart';
import 'package:palikorne/app/view/SignUpView.dart';
import 'package:palikorne/config/Constante.dart';
import 'package:palikorne/generated/l10n.dart';

class LoginView extends StatefulWidget {
  createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool isLogged = false;
  bool rememberMe = false;
  String dropValue = "fr";
  String password;
  String mail;

  Future<String> connect(String mail, String password) async {
    Map<String, String> headers = {
      "Content-type": "application/json; charset=utf-8",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    };
    Object json = {
      "Mail": mail,
      "Password": password,
    };
    Uri uri = Uri.http(Constante.baseApiUrl, "/login");
    Response response =
        await http.post(uri, headers: headers, body: jsonEncode(json));
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Text(S.of(context).connexionMsgConnectionError),
                actions: <Widget>[
                  FlatButton(
                      child: Text(S.of(context).connexionCloseError),
                      onPressed: () => Navigator.pop(context))
                ],
              ));
      return await "";
    }
  }

  void unlogged() {
    setState(() {
      isLogged = false;
    });
  }

  @override
  void initState() {
    User.thatLoginPage = this;
    // User.check().then((isRemember) {
    //   setState(() {
    //     isLogged = isRemember;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLogged
        ? AppView()
        : Scaffold(
            body: Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.15,
                    0,
                    MediaQuery.of(context).size.width * 0.15,
                    0),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(S.of(context).connexionTitle,
                            style: TextStyle(fontSize: 40)),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                  labelText: S.of(context).connexionLabelMail),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S
                                      .of(context)
                                      .inscriptionMsgFieldsEmpty;
                                }
                                RegExp regExp = new RegExp(Constante.regexMail,
                                    caseSensitive: false, multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.mail = value;
                                } else {
                                  return S.of(context).connexionMsgWrongMail;
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              cursorColor: Theme.of(context).primaryColor,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText:
                                      S.of(context).connexionLabelPassword),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return S
                                      .of(context)
                                      .inscriptionMsgFieldsEmpty;
                                }
                                // RegExp regExp = new RegExp(
                                //     Constante.regexPassword,
                                //     caseSensitive: true,
                                //     multiLine: false);
                                // if (regExp.hasMatch(value)) {
                                this.password = value;
                                // } else {
                                //   return S
                                //       .of(context)
                                //       .connexionMsgWrongPassword;
                                // }
                                return null;
                              },
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value;
                                    });
                                  },
                                  activeColor: Theme.of(context).primaryColor,
                                ),
                                Text(S.of(context).connexionLabelRememberMe)
                              ],
                            ),
                            Container(
                              height: 60,
                            ),
                            RaisedButton(
                                color: Theme.of(context).primaryColor,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                    S.of(context).connexionLabelButtonConnexion,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                                onPressed: () async {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  if (_formKey.currentState.validate()) {
                                    this.connect(mail, password.toString()).then((value) {
                                      if (value != "") {
                                        User.connect(mail, jsonDecode(value)["token"],
                                            rememberMe);
                                        setState(() {
                                          this.isLogged = true;
                                        });
                                      }
                                    });
                                  }
                                }),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUpView(this)));
                              },
                              child: Text(
                                S.of(context).connexionLabelGoToInscription,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                      ),
                      DropdownButton(
                        value: dropValue,
                        items: [
                          DropdownMenuItem(
                              value: 'fr',
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(S.of(context).profilLangFr),
                                  )
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'en',
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(S.of(context).profilLangEn),
                                  )
                                ],
                              )),
                        ],
                        onChanged: (item) {
                          setState(() {
                            dropValue = item;
                            S.load(Locale(item, ''));
                          });
                        },
                      ),
                    ])));
  }
}
