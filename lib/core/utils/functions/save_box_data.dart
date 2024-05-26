import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, boxName) {
  var box = Hive.box(kFeatureBox);
  box.addAll(boxName);
}
