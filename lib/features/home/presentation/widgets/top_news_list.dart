import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/text_style.dart';
import '../../data/model/news_model.dart';
import 'top_news_item.dart';

class TopNewsList extends StatelessWidget {
  const TopNewsList({super.key, required this.newsList});
  final List<NewsModel> newsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top News', style: MyStyle.title18(context)),
            TextButton(
              onPressed: () => GoRouter.of(context).pushNamed('all-news'),
              child: Text('See All', style: MyStyle.regular11(context)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...List.generate(
          newsList.length,
          (index) => TopNewsItem(news: newsList[index]),
        ),
      ],
    );
  }
}
