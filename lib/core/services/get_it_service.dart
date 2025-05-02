import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/core/services/api_service.dart';
import 'package:news/features/home/cubit/cubit/news_cubit.dart';

import '../../features/home/data/repo/news_repo.dart';
import '../../features/home/data/repo/news_repo_impl.dart';
import '../utils/endpoints.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'x-api-key': 'cbcf2a0dac044a158e1b7f494629951b',
        },
      ),
    ),
  );
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt.get<NewsRepo>()));
}
