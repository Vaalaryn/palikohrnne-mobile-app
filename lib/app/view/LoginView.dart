import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
    String url = Constante.baseApiUrl + '/fr/user/connect';
    Map<String, String> headers = {"Content-type": "application/json"};
    Object json = {
      "mail": mail,
      "password": password,
    };
    Response response = await post(
        Uri.http(Constante.baseApiUrl, "/fr/user/connect"),
        headers: headers,
        body: jsonEncode(json));
    if (response.statusCode == 200) {
      return await response.body;
    } else {
      return await response.statusCode.toString();
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
    return !isLogged
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
                                RegExp regExp = new RegExp(
                                    Constante.regexPassword,
                                    caseSensitive: true,
                                    multiLine: false);
                                if (regExp.hasMatch(value)) {
                                  this.password = value;
                                } else {
                                  return S
                                      .of(context)
                                      .connexionMsgWrongPassword;
                                }
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
                                    User.connect();
                                    setState(() {
                                      this.isLogged = true;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              content: Text(S
                                                  .of(context)
                                                  .connexionMsgConnectionError),
                                              actions: <Widget>[
                                                FlatButton(
                                                    child: Text(S
                                                        .of(context)
                                                        .connexionCloseError),
                                                    onPressed: () =>
                                                        Navigator.pop(context))
                                              ],
                                            ));
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
