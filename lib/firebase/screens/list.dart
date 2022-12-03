import 'package:all_persistences/firebase/models/person.dart';
import 'package:all_persistences/firebase/screens/add.dart';
import 'package:all_persistences/utils/custom_styles.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class CarListWidget extends StatefulWidget {
  const CarListWidget({Key? key}) : super(key: key);

  @override
  State<CarListWidget> createState() => _CarListWidgetState();
}

class _CarListWidgetState extends State<CarListWidget> {
  final title = const Text("Carros");
  final addPage = CarFormWidget();

  List<Car> cars = [Car("Fiat Uno", "com escada")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => addPage));
              },
              icon: addIcon)
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => _buildItem(index),
          separatorBuilder: (context, index) => dividerList(),
          itemCount: cars.length),
    );
  }

  _buildItem(int index) {
    final car = cars[index];
    return Padding(
        padding: cardPadding,
        child: Container(
          decoration: cardBoxDecoration,
          child: ListTile(
              leading: Text(index.toString()),
              title: Text(car.name),
              subtitle: Text(car.model),
              onLongPress: () {
                // to do deletar
              }),
        ));
  }
}
