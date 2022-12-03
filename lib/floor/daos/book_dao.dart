import 'package:all_persistences/floor/models/book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @Query("SELECT * FROM Book")
  Future<List<Book>> readAll();

  @insert
  Future<void> insertBook(Book book);

  @delete
  Future<void> deleteBook(Book book);
}
