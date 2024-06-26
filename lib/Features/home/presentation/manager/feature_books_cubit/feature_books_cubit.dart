// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.featuredBooksUseCase) : super(FeatureBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> featureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureBooksLoading());
    } else {
      emit(FeatureBooksLoadingPagenition());
    }

    var results = await featuredBooksUseCase.call(pageNumber);
    results.fold((failure) {
      emit(FeatureBooksFailure(messError: failure.messError));
    }, (books) {
      emit(FeatureBooksSuccess(books: books));
    });
  }
}
