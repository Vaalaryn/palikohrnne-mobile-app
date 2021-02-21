import 'package:flutter/material.dart';
import 'package:flutter_cube/widgets/BottomDrawer.dart';
import 'package:flutter_cube/widgets/UserAccountHeader.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CUBE", textAlign: TextAlign.center,),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                UserAccountHeader()
                /*UserAccountsDrawerHeader(
                  accountName: Text("Vous êtes en invité"),
                  accountEmail: Text("None"),
                  currentAccountPicture: CircleAvatar(child: Text("PO", style: TextStyle(fontSize: 40, color: Colors.black),),
                    backgroundColor: Colors.orange,),
                )*/,
                ListTile(title: Text("Menu 1"),),
                ListTile(title: Text("Menu 2"),),

              ],)
            ),
            BottomDrawer()
          ],
        )
      ),
    );
  }
  }