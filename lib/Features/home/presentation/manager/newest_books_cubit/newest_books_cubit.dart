// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch-newest-books-use-case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;

  Future<void> newestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksLoadingPagenition());
    }

    var result = await newestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      emit(NewestBooksFailure(messError: failure.messError));
    }, (books) {
      emit(NewestBooksSuccess(books: books));
    });
  }
}
