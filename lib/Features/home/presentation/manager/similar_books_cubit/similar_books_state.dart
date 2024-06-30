part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {
  const SimilarBooksState();
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksFailure extends SimilarBooksState {
  final String messError;

  SimilarBooksFailure(this.messError);
}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  List<BookEntity> books;
  SimilarBooksSuccess(this.books);
}

class SimilarBooksLoadingPagenition extends SimilarBooksState {}
