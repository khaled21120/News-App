import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/themes/text_style.dart';
import '../../data/model/news_model.dart';

class TopNewsItem extends StatelessWidget {
  const TopNewsItem({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).pushNamed('details', extra: news),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                child: Image.network(
                  news.image,
                  height: 130,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(news.title, style: MyStyle.semi9(context)),
                      Row(
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 16,
                            color: MyColors.white,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Read',
                            style: MyStyle.semi9(context).copyWith(fontSize: 8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
