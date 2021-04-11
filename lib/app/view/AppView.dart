import 'package:flutter/material.dart';
import 'package:palikorne/app/view/ListRessourceView.dart';
import 'package:palikorne/app/view/SettingsView.dart';
import 'package:palikorne/app/view/UserAccountView.dart';

import 'AdminView.dart';

class AppView extends StatefulWidget {
  @override
  AppViewState createState() => AppViewState();
}

class AppViewState extends State<AppView> with SingleTickerProviderStateMixin {
  List test = [];

  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: !(3 >= 2) ? 4 : 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          ListResourceView(),
          ListResourceView(),
          ...(!(3 >= 2) ? test : [AdminView()]),
          UserAccountView(),
          SettingsView()
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).backgroundColor,
        child: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            tabs: <Tab>[
              Tab(
                  icon: Icon(
                Icons.library_books,
                size: 25,
              )),
              Tab(
                  icon: Icon(
                Icons.favorite,
                size: 25,
              )),
              ...(!(3 >= 2)
                  ? test
                  : [
                      Tab(
                        icon: Icon(
                          Icons.star,
                          size: 25,
                        ),
                      )
                    ]),
              Tab(
                icon: Icon(
                  Icons.person,
                  size: 25,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.settings,
                  size: 25,
                ),
              ),
            ],
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).textTheme.body1.color),
      ),
    );
  }
}
