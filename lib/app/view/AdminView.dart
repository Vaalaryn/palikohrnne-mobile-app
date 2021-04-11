import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palikorne/app/view/SettingsView.dart';
import 'package:palikorne/app/view/admin/CategoriesRessources.dart';
import 'package:palikorne/app/view/admin/CompteCitoyen.dart';
import 'package:palikorne/app/view/admin/Droit.dart';
import 'package:palikorne/app/view/admin/GestionRessources.dart';
import 'package:palikorne/app/view/admin/Statistique.dart';
import 'package:palikorne/app/view/admin/ValidationRessources.dart';
import 'package:palikorne/app/widget/OptionListAdmin.dart';

class AdminView extends StatelessWidget {

  List<Widget> builderAdmin() {
    List<Widget> menuList = [];
    //Droit Moderateur
    if(true){
      menuList.add(OptionListAdmin("Tableau de statistique", Statistique()));
    }
    // Droit Admin
    if(true){
      menuList.add(OptionListAdmin("Catégorie de ressource", CategoriesRessources()));
      menuList.add(OptionListAdmin("Compte citoyen",  CompteCitoyen()));
      menuList.add(OptionListAdmin("Gestion des ressources",  GestionRessources()));
      menuList.add(OptionListAdmin("Validation des ressources",  ValidationRessources()));
    }
    // Droit super-admin
    if(true){
      menuList.add(OptionListAdmin("Droit D'administration",  Droit()));
    }
    return menuList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [...builderAdmin()],
    );
  }
}
