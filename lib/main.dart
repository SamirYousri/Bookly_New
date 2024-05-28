import 'package:bookly/Features/home/data/repos/home_repo_implm.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch-newest-books-use-case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/views/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/functions/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeatureBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  runApp(const Bookly());
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeatureBooksCubit(
                FetchFeaturedBooksUseCase(getIt.get<HomeRepoImplm>()))
              ..featureBooks();
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepoImplm>()))
              ..newestBooks();
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
