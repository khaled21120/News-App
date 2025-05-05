import 'package:go_router/go_router.dart';
import 'package:news/features/home/presentation/details/details_view.dart';
import '../../features/home/data/model/news_model.dart';
import '../../features/home/presentation/All News/all_news_view.dart';
import '../../features/home/presentation/home_view.dart';
import '../../features/onBoarding/presentation/onbording_view.dart';

class AppRouters {
  static GoRouter router(bool showOnboarding) {
    return GoRouter(
      initialLocation: showOnboarding ? '/onboarding' : '/home',
      routes: [
        GoRoute(
          path: '/onboarding',
          name: 'onboarding',
          builder: (_, _) => const OnbordingView(),
        ),
        GoRoute(
          path: '/details',
          name: 'details',
          builder: (_, state) {
            final news = state.extra as NewsModel;
            return DetailsView(news: news);
          },
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (_, _) => const HomeView(),
        ),
        GoRoute(
          path: '/all-news',
          name: 'all-news',
          builder: (_, _) => const AllNewsView(),
        ),
      ],
    );
  }
}
