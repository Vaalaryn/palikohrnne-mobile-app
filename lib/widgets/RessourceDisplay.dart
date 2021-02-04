import 'package:flutter/material.dart';

class RessourceDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Text(
                "Titre de la ressource",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Text(
                "Aujourd'hui à 15:20",
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05,
                top: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Text(
                "Message",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do"
                " eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                "Ut enim ad minim veniam, quis nostrud exercitation ullamco "
                "laboris nisi ut aliquip ex ea commodo consequat. "
                "Duis aute irure dolor in reprehenderit in voluptate velit "
                "esse cillum dolore eu fugiat nulla pariatur. Excepteur sint "
                "occaecat cupidatat non proident, sunt in culpa qui officia "
                "deserunt mollit anim id est laborum.",
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.macrumors.com/t/x_zUFqghBUNBxVUZN_dYoKF3D9g=/1600x0/article-new/2019/04/guest-user-250x250.jpg'),
                    radius: 17,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nom et prénom"),
                        Text("Il y a 5 minutes")
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Divider(),
            ),
            Container(
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        child: Icon(Icons.favorite),
                        backgroundColor: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        child: Icon(Icons.comment),
                        backgroundColor: Colors.green,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
              ),
              child: Divider(),
            ),
            Container(
              child: Text(
                "Tags",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.deepPurple,
                    label: Text('BADGE', style: TextStyle(color: Colors.white)),
                  ),
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.deepPurple,
                    label: Text('BADGE', style: TextStyle(color: Colors.white)),
                  ),
                  Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.deepPurple,
                    label: Text('BADGE', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Container(
                child: Text(
              "Réponses",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ))
          ],
        ),
      ),
    );
  }
}
