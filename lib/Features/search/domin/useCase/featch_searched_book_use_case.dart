import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/domin/repo/search_repos.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase extends UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;
  SearchUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call([String? param]) {
    return searchRepo.getSearchedBooks(searchWord: param!);
  }
}
