import 'package:all_persistences/sqlite/models/person.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:all_persistences/widgets/input_form.dart';
import 'package:flutter/material.dart';

class PersonFormWidget extends StatelessWidget {
  PersonFormWidget({Key? key}) : super(key: key);

  final title = const Text("Nova Pessoa");
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultInputFormWidget(
                      placeholder: "Informe o nome",
                      label: "Nome",
                      controller: _nameController,
                      validationMsg: "Insira o nome da pessoa"),
                  DefaultInputFormWidget(
                      placeholder: "Informe o sobrenome",
                      label: "Sobrenome",
                      controller: _lastNameController,
                      validationMsg: "Insira o sobrenome da pessoa"),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final person = Person(
                                _nameController.text, _lastNameController.text);
                            Navigator.pop(context, person);
                          }
                        },
                        child: salvarText),
                  )
                ],
              ))),
    );
  }
}
