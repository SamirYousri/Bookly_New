// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/use_cases/fetchSimilarBooksUseCase.dart';

import '../../../domain/entities/book_entity.dart';
part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());

  final FetchSimilarBooksUseCase similarBooksUseCase;

  Future<void> similarBooks(
      {required String category, int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SimilarBooksLoading());
    } else {
      emit(SimilarBooksLoadingPagenition());
    }

    var result = await similarBooksUseCase.call(
        category: category, pageNumber: pageNumber);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.messError));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
