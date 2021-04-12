import 'package:flutter/material.dart';
import 'package:palikorne/generated/l10n.dart';
import 'package:palikorne/main.dart';

class SettingsView extends StatefulWidget{
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = (Theme.of(context).brightness == Brightness.dark);
    var dropValue = S.of(context).actualLocale;
   return ListView(children: <Widget>[
      ListTile(
          title: Text(S.of(context).profilDarkTheme),
          trailing: Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = !isSwitched;
                ThemeData theme =
                value ?
                ThemeData(
                  primaryColor: Color(0xff51b37f),
                  accentColor: Colors.lightGreenAccent,
                  backgroundColor: Colors.lime,
                  brightness: Brightness.dark,
                ) :
                ThemeData(
                  primaryColor: Color(0xff51b37f),
                  accentColor: Colors.lightGreenAccent,
                  backgroundColor: Colors.grey,
                  brightness: Brightness.light,
                );
                ThemeSwitcher.of(context).switchTheme(theme);
              });
            },
            activeTrackColor: Theme.of(context).primaryColor,
            activeColor: Theme.of(context).accentColor,
          )),
      ListTile(
        title: Text(S.of(context).profilLangLabel),
        trailing: DropdownButton(
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
      ),
    ]);
  }
}