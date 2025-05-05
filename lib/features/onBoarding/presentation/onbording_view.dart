import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/services/prefs_service.dart';
import 'package:news/core/themes/light_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/onboarding_page.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final List<Widget> pages = [
    OnboardingPage(
      icon: Icons.article_rounded,
      title: 'Latest News',
      description:
          'Stay informed with the latest headlines from around the world, updated in real time.',
      color: MyColors.primary,
    ),
    OnboardingPage(
      icon: Icons.favorite_border,
      title: 'Personalized Content',
      description: 'Get news tailored to your interests and reading habits.',
      color: Colors.teal,
    ),
    OnboardingPage(
      icon: Icons.notifications_active,
      title: 'Real-time Alerts',
      description: 'Never miss a story—get notified instantly as news breaks.',
      color: MyColors.accent,
    ),
  ];
  int currentIndex = 0;
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) => setState(() => currentIndex = value),
              controller: pageController,
              children: pages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.secondary,
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onPressed: () {
                    PrefsService.setBool(value: false);
                    GoRouter.of(context).goNamed('home');
                  },
                  child: const Text('Skip'),
                ),
                SmoothPageIndicator(
                  onDotClicked: (index) => pageController.jumpToPage(index),
                  controller: pageController,
                  count: pages.length,
                  effect: JumpingDotEffect(
                    verticalOffset: 20,
                    dotColor: Colors.grey,
                    activeDotColor: MyColors.accent,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    if (currentIndex == pages.length - 1) {
                      await PrefsService.setBool(value: false);
                      // ignore: use_build_context_synchronously
                      GoRouter.of(context).goNamed('home');
                    } else {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.bounceInOut,
                      );
                    }
                  },
                  child:
                      currentIndex == pages.length - 1
                          ? const Text('Start')
                          : const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
