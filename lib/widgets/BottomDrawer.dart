import 'package:flutter/material.dart';
import 'package:flutter_cube/widgets/LoginPage.dart';
import 'package:flutter_cube/widgets/RegisterPage.dart';

class BottomDrawer extends StatelessWidget{
  BottomDrawer({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          child: Row(
            //alignment: MainAxisAlignment.center,
            children: [

              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 2.5),
                    child: RaisedButton(

                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Se Connecter"),
                        shape: RoundedRectangleBorder(side: BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid
                        ), borderRadius: BorderRadius.circular(50)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                        }
                    ),
                  )),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.5, right: 5),
                    child: RaisedButton(

                        color: Colors.white,
                        textColor: Colors.blue,
                        child: Text("S'inscrire'"),
                        shape: RoundedRectangleBorder(side: BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid
                        ), borderRadius: BorderRadius.circular(50)),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        }
                    ),
                  )),





            ],),
        ),
      ),
    );
  }
}