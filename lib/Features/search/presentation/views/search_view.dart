import 'package:bookly/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly/Features/search/domin/useCase/featch_searched_book_use_case.dart';
import 'package:bookly/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly/core/utils/functions/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
            create: (context) =>
                SearchCubit(SearchUseCase(getIt.get<SearchRepoImp>())),
            child: const SearchViewBody()),
      ),
    );
  }
}
