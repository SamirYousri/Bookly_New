// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/search/domin/useCase/featch_searched_book_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  SearchCubit(this.searchUseCase) : super(InitialSearchState());
  String word = '';
  void fetchWord({required String searchWord}) {
    word = searchWord;
    if (word == '') {
      emit(InitialAfterSearchState());
    }
  }

  Future<void> fetchSearchBooks() async {
    emit(LoadingSearchState());
    var result = await searchUseCase.call(word);
    return result.fold((failure) {
      emit(FailureSearchState(failure.messError));
    }, (book) {
      emit(SuccessSearchState(book));
    });
  }
}
