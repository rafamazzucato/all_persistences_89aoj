import 'package:all_persistences/floor/daos/book_dao.dart';
import 'package:all_persistences/floor/database/app_database.dart';
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

  BookDao? dao;
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _getAll();
  }

  _getAll() async {
    if (dao == null) {
      final database = await $FloorAppDatabase
          .databaseBuilder("book_floor_database.db")
          .build();

      dao = database.bookDao;
    }

    if (dao != null) {
      final result = await dao!.readAll();
      setState(() {
        books = result;
      });
    }
  }

  _insertBook(Book book) async {
    if (dao != null) {
      await dao!.insertBook(book);
      await _getAll();
    }
  }

  _deleteBook(Book book) async {
    if (dao != null) {
      await dao!.deleteBook(book);
      await _getAll();
    }
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
                    .then((book) => _insertBook(book));
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
              leading: Text(book.id.toString()),
              title: Text(book.name),
              subtitle: Text(book.description),
              onLongPress: () {
                _deleteBook(book);
              }),
        ));
  }
}
