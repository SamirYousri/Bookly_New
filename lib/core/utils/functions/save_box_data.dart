import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, boxName) {
  var box = Hive.box(boxName);
  box.addAll(books);
}
