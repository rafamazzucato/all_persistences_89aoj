import 'package:all_persistences/floor/models/person.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:all_persistences/widgets/input_form.dart';
import 'package:flutter/material.dart';

class BookFormWidget extends StatelessWidget {
  BookFormWidget({Key? key}) : super(key: key);

  final title = const Text("Novo Livro");
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

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
                      validationMsg: "Insira o nome do livro"),
                  DefaultInputFormWidget(
                      placeholder: "Informe a descrição",
                      label: "Descrição",
                      controller: _descriptionController,
                      validationMsg: "Insira o descrição do livro"),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final book = Book(_nameController.text,
                                _descriptionController.text);
                            Navigator.pop(context, book);
                          }
                        },
                        child: salvarText),
                  )
                ],
              ))),
    );
  }
}
