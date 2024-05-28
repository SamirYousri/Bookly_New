part of 'newest_books_cubit.dart';

abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String messError;

  NewestBooksFailure({required this.messError});
}

class NewestBooksSuccess extends NewestBooksState {
  List<BookEntity> books;
  NewestBooksSuccess({required this.books});
}
