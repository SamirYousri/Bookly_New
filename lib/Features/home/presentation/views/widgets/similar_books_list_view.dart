import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatefulWidget {
  const SimilarBooksListview({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<SimilarBooksListview> createState() => _SimilarBooksListviewState();
}

class _SimilarBooksListviewState extends State<SimilarBooksListview> {
  late ScrollController scrollController;
  int nextPage = 1;
  bool isLoding = false;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    if (scrollController.position.pixels >=
        0.7 * scrollController.position.maxScrollExtent) {
      if (!isLoding) {
        isLoding = true;
        await BlocProvider.of<SimilarBooksCubit>(context).similarBooks(
            category: widget.books[0].category ?? 'programming',
            pageNumber: nextPage++);
        isLoding = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
          controller: scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                bookEntity: widget.books[index],
              ),
            );
          }),
    );
  }
}
