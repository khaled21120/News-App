import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/themes/light_theme.dart';

import '../../cubit/news/news_cubit.dart';
import '../widgets/top_news_item.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.scaffold,
        centerTitle: true,
        foregroundColor: MyColors.accent,
        titleSpacing: 3,
        title: const Text('All News'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsFailure) {
            return Center(child: Text(state.message));
          } else if (state is NewsSuccess) {
            if (state.newsResponse.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.builder(
                  itemCount: state.newsResponse.length,
                  itemBuilder: (context, index) {
                    return TopNewsItem(news: state.newsResponse[index]);
                  },
                ),
              );
            } else {
              return const Center(child: Text('No Data'));
            }
          }
          return Center(child: Text('Error'));
        },
      ),
    );
  }
}
