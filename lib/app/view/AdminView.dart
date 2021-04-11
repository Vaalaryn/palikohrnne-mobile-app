import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palikorne/app/view/SettingsView.dart';
import 'package:palikorne/app/widget/OptionListAdmin.dart';
import 'package:palikorne/generated/l10n.dart';

class AdminView extends StatelessWidget {

  List<Widget> builderAdmin() {
    List<Widget> menuList = [];
    //Droit Moderateur
    if(true){
      menuList.add(OptionListAdmin("Tableau de statistique", SettingsView()));
    }
    // Droit Admin
    if(true){
      menuList.add(OptionListAdmin("Catégorie de ressource", SettingsView()));
      menuList.add(OptionListAdmin("Compte citoyen",  SettingsView()));
      menuList.add(OptionListAdmin("Gestion des ressources",  SettingsView()));
      menuList.add(OptionListAdmin("Validation des ressources",  SettingsView()));
    }
    // Droit super-admin
    if(true){
      menuList.add(OptionListAdmin("Droit D'administration",  SettingsView()));
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
