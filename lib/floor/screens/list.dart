import 'package:all_persistences/floor/models/book.dart';
import 'package:all_persistences/floor/screens/add.dart';
import 'package:all_persistences/utils/custom_styles.dart';
import 'package:all_persistences/utils/custom_widgets.dart';
import 'package:flutter/material.dart';

class BookListWidget extends StatefulWidget {
  const BookListWidget({Key? key}) : super(key: key);

  @override
  State<BookListWidget> createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  final title = const Text("Livros");
  final addPage = BookFormWidget();

  List<Book> books = [Book("As Leis do sucesso", "Napoleon Hill")];

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
          itemCount: books.length),
    );
  }

  _buildItem(int index) {
    final book = books[index];
    return Padding(
        padding: cardPadding,
        child: Container(
          decoration: cardBoxDecoration,
          child: ListTile(
              leading: Text(index.toString()),
              title: Text(book.name),
              subtitle: Text(book.description),
              onLongPress: () {
                // to do deletar
              }),
        ));
  }
}
