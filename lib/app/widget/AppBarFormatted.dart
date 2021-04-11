import 'package:flutter/material.dart';

class AppBarFormatted extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return AppBar(
      bottom: PreferredSize(
          child: Container(
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
    );
  }
}