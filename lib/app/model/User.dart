import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:palikorne/app/view/LoginView.dart';
import 'package:palikorne/config/Constante.dart';
import 'package:http/http.dart';

class User {
  static String Lang = Constante.defaultLang;

  static LoginViewState thatLoginPage;

  static int _Id;
  static int get Id => _Id;

  static String _Mail;
  static String get Mail => _Mail;

  static String _Pseudo;
  static String get Pseudo => _Pseudo;

  static String _Nom;
  static String get Nom => _Nom;

  static String _Prenom;
  static String get Prenom => _Prenom;

  static String _Genre;
  static String get Genre => _Genre;

  static String _CodePostal;
  static String get CodePostal => _CodePostal;

  static String _Adresse;
  static String get Adresse => _Adresse;

  static String _Ville;
  static String get Ville => _Ville;

  static String _Telephone;
  static String get Telephone => _Telephone;

  static String _Rang;
  static String get Rang => _Rang;

  static String _Token;
  static String get Token => _Token;

  static connect(String mail, String token, bool rememberMe) async {
    _Token = token;
    Map<String, String> headers = {
      "Content-type": "application/json; charset=utf-8",
    };
    Uri uri = Uri.http(Constante.baseApiUrl, "/citoyenByMail", {"Mail" : mail});
    Response response = await get(uri,
        headers: headers,
    );
    dynamic data = jsonDecode(response.body)["data"];
    debugPrint(data["Pseudo"]);
    _Ville = data["Ville"];
    _Telephone = data["Telephone"];
    _Adresse = data["Adresse"];
    _Genre = data["Genre"];
    _Pseudo = data["Pseudo"];
    _CodePostal = data["CodePostal"];
    _Id = data["ID"];
    _Mail = data["Mail"];
    _Prenom = data["Prenom"];
    _Nom = data["Nom"];
    _Rang = data["Rang"];
  }

  static Future<bool> check() {
  }

  static disconnect() {
    _Mail = null;
    _Mail = "";
    _Prenom = "";
    _Nom = "";
    _Rang = "";
    _Token = "";
    _Ville = "";
    _Telephone = "";
    _Adresse = "";
    _Genre = "";
    _Pseudo = "";
    _CodePostal = "";
  }

  static updateData() async {
  }

  static Future<String> updateUserData(String password,Object data) async {
  }

}