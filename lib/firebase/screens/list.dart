import 'package:all_persistences/firebase/models/car.dart';
import 'package:all_persistences/firebase/screens/add.dart';
import 'package:all_persistences/utils/custom_styles.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CarListWidget extends StatefulWidget {
  const CarListWidget({Key? key}) : super(key: key);

  @override
  State<CarListWidget> createState() => _CarListWidgetState();
}

class _CarListWidgetState extends State<CarListWidget> {
  final title = const Text("Carros");
  final addPage = CarFormWidget();

  _insertCar(Car car) async {
    await FirebaseFirestore.instance.collection("cars").add(car.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => addPage))
                    .then((car) => _insertCar(car));
              },
              icon: addIcon)
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("cars").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          if (snapshot.data == null) {
            return Container(child: Text("Nenhum carro encontrado!"));
          } else {
            return _buildListView(context, snapshot.data!.docs);
          }
        });
  }

  Widget _buildListView(
      BuildContext context, List<QueryDocumentSnapshot> snapshots) {
    return ListView(
        padding: EdgeInsets.only(top: 30),
        children: snapshots.map((data) => _buildItem(data)).toList());
  }

  Widget _buildItem(QueryDocumentSnapshot data) {
    final car = Car.fromSnapshot(data);
    return Padding(
        padding: cardPadding,
        child: Container(
          decoration: cardBoxDecoration,
          child: ListTile(
              leading: Text('0'),
              title: Text(car.name),
              subtitle: Text(car.model),
              onLongPress: () {
                data.reference.delete();
              }),
        ));
  }
}
