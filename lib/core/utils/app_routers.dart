import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/services/get_it_service.dart';
import 'package:news/features/home/cubit/cubit/news_cubit.dart';
import 'package:news/features/home/presentation/details/details_view.dart';
import '../../features/home/data/model/news_model.dart';
import '../../features/home/presentation/home_view.dart';
import '../../features/onBoarding/presentation/onbording_view.dart';

abstract class AppRouters {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/f', builder: (_, _) => const OnbordingView()),
      GoRoute(
        path: '/details',
        name: 'details',
        builder: (_, state) {
          final news = state.extra as NewsModel;
          return BlocProvider(
            create: (context) => getIt.get<NewsCubit>()..fetchNews(),
            child: DetailsView(news: news),
          );
        },
      ),
      GoRoute(
        path: '/',
        builder:
            (_, _) => BlocProvider(
              create: (context) => getIt.get<NewsCubit>()..fetchNews(),
              child: const HomeView(),
            ),
      ),
    ],
  );
}
