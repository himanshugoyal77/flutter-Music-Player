// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';

class Mydrawer extends StatefulWidget {
  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  String name = "";
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Colors.white70,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.purple),
                    accountName: Text(
                      "Hi $name",
                    ),
                    accountEmail: Text("yourEmail@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("asssets/images/newpp.jpg"),
                    )),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 6.0)),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.black,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.black,
                ),
                title: Text(
                  "Mail",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
