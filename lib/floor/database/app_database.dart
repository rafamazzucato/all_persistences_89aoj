import 'dart:async';

import 'package:all_persistences/floor/daos/book_dao.dart';
import 'package:all_persistences/floor/models/book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Book])
abstract class AppDatabase extends FloorDatabase {
  BookDao get bookDao;
}
