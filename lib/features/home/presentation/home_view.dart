import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/news/news_cubit.dart';

import 'widgets/custom_appbar.dart';
import 'widgets/image_slider.dart';
import 'widgets/top_news_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsFailure) {
              return Center(child: Text(state.message));
            } else if (state is NewsSuccess) {
              if (state.newsResponse.isNotEmpty) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        spacing: 20,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppbar(),
                          ImageSlider(news: state.newsResponse),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: TopNewsList(newsList: state.newsResponse),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No Data'));
              }
            }
            return Center(child: Text('Error'));
          },
        ),
      ),
    );
  }
}
