import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/pages/utils/widgets/drawer.dart';

import 'utils/widgets/Item_Widgets.dart';

class Homepage extends StatelessWidget {
  int days = 30;
  String name = "codepur";
  var day = "wednesday";
  final pi = 3.14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          textAlign: TextAlign.right,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
    itemCount: catalogModel.items.length ,
    itemBuilder: (context , index){
      return ItemWidget(
        items: catalogModel.items[index],
            );
    } ),
      ),
      drawer: Mydrawer(),
    );
  }
}
