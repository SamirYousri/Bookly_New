import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/data/dataSource/search_remote_data_source.dart';
import 'package:bookly/Features/search/domin/repo/search_repos.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImp(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> getSearchedBooks(
      {required String searchWord}) async {
    List<BookEntity> booksList;
    try {
      booksList =
          await searchRemoteDataSource.searchRemoteData(searchWord: searchWord);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(messError: e.toString()));
    }
  }
}
