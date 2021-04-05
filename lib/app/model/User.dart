import 'package:palikorne/app/view/LoginView.dart';
import 'package:palikorne/config/Constante.dart';

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

  static connect() {
    _Id = 1;
    _Mail = "toto@gmail.toto";
    _Prenom = "Brice";
    _Nom = "Bitot";
    _Rang = "1";
    _Token = "hjdsgjkhds";
    _Ville = "Rouen";
    _Telephone = "0659545362";
    _Adresse = "98 rue des toto";
    _Genre = "M";
    _Pseudo = "Vaala";
    _CodePostal = "76120";
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