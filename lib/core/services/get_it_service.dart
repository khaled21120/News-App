import 'package:get_it/get_it.dart';
import 'package:news/core/services/api_service.dart';
import 'package:news/features/home/cubit/news/news_cubit.dart';

import '../../features/home/data/repo/news_repo.dart';
import '../../features/home/data/repo/news_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<NewsRepo>(NewsRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt.get<NewsRepo>()));
}
