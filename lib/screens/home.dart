import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:all_persistences/widgets/list_home_item.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  final title = const Text("Flutter - Persistência");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: ListView(children: [
        const ListHomeItemWidget(
            path: "images/sqlite-icon.svg",
            title: "SQList",
            subtitle: "Lista de pessoas",
            route: "/person"),
        dividerList(),
        const ListHomeItemWidget(
            path: "images/db.svg",
            title: "Floor",
            subtitle: "Lista de livros",
            route: "/book"),
        dividerList(),
        const ListHomeItemWidget(
            path: "images/firebase.svg",
            title: "Firebase",
            subtitle: "Lista de carros",
            route: "/car"),
      ]),
    );
  }
}
