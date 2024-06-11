// ignore_for_file: file_names

import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBooksCubit, FeatureBooksState>(
      listener: (context, state) {
        if (state is FeatureBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
          builder: (context, state) {
            if (state is FeatureBooksSuccess ||
                state is FeatureBooksLoadingPagenition) {
              return FeaturedBooksListView(
                books: books,
              );
            } else if (state is FeatureBooksFailure) {
              return Text(state.messError);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
