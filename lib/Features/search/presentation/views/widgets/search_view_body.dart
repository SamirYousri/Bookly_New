import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSearchTextField(),
        SizedBox(
          height: 20,
        ),
        SearchListItems()
      ],
    );
  }
}

class SearchListItems extends StatelessWidget {
  const SearchListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SuccessSearchState) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return BookListViewItem(books: state.books[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is FailureSearchState) {
          return Center(child: Text(state.errMessage));
        } else if (state is InitialSearchState ||
            state is InitialAfterSearchState) {
          return const Center(child: Text('search for programming books'));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
