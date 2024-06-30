import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.bookEntity});
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsView, extra: bookEntity);
      },
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: bookEntity.image!,
            errorWidget: (context, url, error) =>
                const Icon(Icons.broken_image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
