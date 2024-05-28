import 'package:bookly/Features/home/data/data_source/local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implm.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImplm>(
    HomeRepoImplm(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImplem(getIt.get<ApiService>()),
    ),
  );
}
