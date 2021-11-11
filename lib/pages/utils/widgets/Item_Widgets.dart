import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Items items;

  const ItemWidget({Key? key, required this.items})
      : assert(items != null),
        super(key: key);
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          onTap: () {
            print("$items.name is pressed");
          },
          leading: Image.asset(items.img),
          title: Text(items.name),
          subtitle: Text(items.desc),
          tileColor: Colors.white,
          trailing: Text("\$${items.price}")),
    );
  }
}
