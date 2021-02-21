import 'package:flutter/material.dart';

class UserAccountHeader extends StatelessWidget{
  UserAccountHeader({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UserAccount();
  }

  Widget UserAccount(){
    return UserAccountsDrawerHeader(
      accountName: Text("Vous êtes en invité"),
      accountEmail: Text(""),
      currentAccountPicture: CircleAvatar(child: Text("?", style: TextStyle(fontSize: 40, color: Colors.blue),),
        backgroundColor: Colors.white,),
    );
  }

}