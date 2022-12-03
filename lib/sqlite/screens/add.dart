import 'package:flutter/material.dart';

class PersonFormWidget extends StatelessWidget {
  const PersonFormWidget({Key? key}) : super(key: key);

  final title = const Text("Nova Pessoa");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title),
    );
  }
}
