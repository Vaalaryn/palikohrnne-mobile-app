import 'package:flutter/material.dart';

class LineBreak extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery
            .of(context)
            .size
            .height * 0.01,
      ),
      child: Divider(),
    );
  }
}