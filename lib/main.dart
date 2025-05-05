import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/services/get_it_service.dart';
import 'package:news/core/services/prefs_service.dart';
import 'package:news/core/themes/light_theme.dart';
import 'package:news/features/home/cubit/news/news_cubit.dart';

import 'core/utils/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await PrefsService.init();
  final showOnboarding = PrefsService.getBool() ?? true;
  runApp(
    BlocProvider(
      create: (context) => getIt.get<NewsCubit>()..fetchNews(),
      child: NewsApp(showOnboarding: showOnboarding),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key, required this.showOnboarding});
  final bool showOnboarding;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightThemeData,
      routerConfig: AppRouters.router(showOnboarding),
    );
  }
}
