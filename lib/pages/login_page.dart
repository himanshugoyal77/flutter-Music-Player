import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveTpHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Center(
            child: Material(
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Image.asset(
                        "asssets/images/login.png.png",
                        fit: BoxFit.cover,
                        height: 270,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "welcome $name",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 32.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Enter Username",
                                  labelText: "username"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "userName Is Empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                name = value;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Is Empty";
                                } else if (value.length < 6) {
                                  return "Password must be 6 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Material(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 70 : 8),
                              child: InkWell(
                                onTap: () => moveTpHome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: changeButton ? 70 : 130,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: changeButton
                                      ? Icon(Icons.done, color: Colors.white)
                                      : Text(
                                          "login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),

                                  //  shape: changeButton? BoxShape.circle:BoxShape.rectangle,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )))));
  }
}
