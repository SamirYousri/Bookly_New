import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> searchRemoteData({required String searchWord});
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  final ApiService apiServices;
  SearchRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<BookEntity>> searchRemoteData(
      {required String searchWord}) async {
    var result = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=programming+$searchWord');
    List<BookEntity> books = [];
    for (var item in result['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
