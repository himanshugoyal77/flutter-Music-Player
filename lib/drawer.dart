// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'app_colors.dart' as AppColors;
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  String name = "";
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: AppColors.audiobluebackgroundcolor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    decoration: BoxDecoration(color: Colors.blue),
                    accountName: Text(
                      "NewUser",
                    ),
                    accountEmail: const Text("NewUser123@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/img/YourName1.jpg"),
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
