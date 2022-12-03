import 'package:all_persistences/sqlite/models/person.dart';
import 'package:all_persistences/sqlite/screens/add.dart';
import 'package:all_persistences/utils/custom_styles.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PersonListWidget extends StatefulWidget {
  const PersonListWidget({Key? key}) : super(key: key);

  @override
  State<PersonListWidget> createState() => _PersonListWidgetState();
}

class _PersonListWidgetState extends State<PersonListWidget> {
  final title = const Text("Pessoas");
  final addPage = PersonFormWidget();

  List<Person> persons = [Person("Rafael", "Thomazelli Mazzucato")];

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
          itemCount: persons.length),
    );
  }

  _buildItem(int index) {
    final person = persons[index];
    return Padding(
        padding: cardPadding,
        child: Container(
          decoration: cardBoxDecoration,
          child: ListTile(
              leading: Text(index.toString()),
              title: Text(person.name),
              subtitle: Text(person.lastName),
              onLongPress: () {
                // to do deletar
              }),
        ));
  }
}
