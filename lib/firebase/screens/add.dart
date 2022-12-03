import 'package:all_persistences/firebase/models/person.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:all_persistences/widgets/input_form.dart';
import 'package:flutter/material.dart';

class CarFormWidget extends StatelessWidget {
  CarFormWidget({Key? key}) : super(key: key);

  final title = const Text("Novo Carro");
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _modelController = TextEditingController();

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
                      validationMsg: "Insira o nome do carro"),
                  DefaultInputFormWidget(
                      placeholder: "Informe o modelo",
                      label: "Modelo",
                      controller: _modelController,
                      validationMsg: "Insira o modelo do carro"),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final car = Car(
                                _nameController.text, _modelController.text);
                            Navigator.pop(context, car);
                          }
                        },
                        child: salvarText),
                  )
                ],
              ))),
    );
  }
}
