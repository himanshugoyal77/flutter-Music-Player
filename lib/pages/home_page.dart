import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  int days = 30;
    String name = "codepur";
    var day = "wednesday";
    final pi = 3.14;
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
            body: Center(
      child: Container(
          child: Text("welcome to $days days of flutter by $name on $day")
          ),
    ),
    drawer: Drawer(),
    );
  }
}