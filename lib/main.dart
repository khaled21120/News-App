import 'package:flutter/material.dart';
import 'package:news/core/services/get_it_service.dart';
import 'package:news/core/services/prefs_service.dart';
import 'package:news/core/themes/light_theme.dart';

import 'core/utils/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsService.init();
  setupServiceLocator();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightThemeData,
      routerConfig: AppRouters.router,
    );
  }
}
