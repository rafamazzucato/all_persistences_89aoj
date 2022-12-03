import 'package:all_persistences/sqlite/daos/base_dao.dart';
import 'package:all_persistences/sqlite/models/person.dart';
import 'package:sqflite/sqflite.dart';

class PersonDao extends BaseDao {
  Future<List<Person>> readAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("Person");

    final result = List.generate(maps.length, (index) {
      return Person(maps[index]['name'], maps[index]['lastName'],
          id: maps[index]['id']);
    });

    return result;
  }

  Future<int> insertPerson(Person person) async {
    final db = await getDatabase();
    return db.insert("Person", person.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> removePerson(int id) async {
    final db = await getDatabase();
    return db.delete("Person", where: ' id = ? ', whereArgs: [id]);
  }
}
