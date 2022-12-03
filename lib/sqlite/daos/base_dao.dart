import 'package:sqflite/sqflite.dart';

abstract class BaseDao {
  Future<Database> getDatabase() async {
    Database db =
        await openDatabase('person_database.db', onCreate: (db, version) {
      return db.execute("CREATE TABLE Person(id INTEGER PRIMARY KEY, " +
          "name TEXT, lastName TEXT); ");
    }, version: 1);
    return db;
  }
}
