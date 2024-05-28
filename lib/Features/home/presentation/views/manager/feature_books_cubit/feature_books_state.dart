part of 'feature_books_cubit.dart';

abstract class FeatureBooksState {}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksFailure extends FeatureBooksState {
  final String messError;
  FeatureBooksFailure({required this.messError});
}

class FeatureBooksSuccess extends FeatureBooksState {
  final List<BookEntity> books;
  FeatureBooksSuccess({required this.books});
}
