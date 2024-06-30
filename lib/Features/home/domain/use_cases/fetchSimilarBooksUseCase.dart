// ignore_for_file: file_names

import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchSimilarBooksUseCase {
  final HomeRepo homeRepo;

  FetchSimilarBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> call(
      {required String category, int pageNumber = 0}) async {
    return await homeRepo.fetchSimilarBooks(
        category: category, pageNumber: pageNumber);
  }
}
//  ?? 'progranning'