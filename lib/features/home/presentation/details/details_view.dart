import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/themes/light_theme.dart';
import 'package:news/core/themes/text_style.dart';
import 'package:news/features/home/data/model/news_model.dart';

import '../../cubit/news/news_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsFailure) {
            return Center(child: Text(state.message));
          } else if (state is NewsSuccess) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _topImageWithBack(context, news.image),
                      _overlayContent(context, news),
                      _content(context, news.text),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _content(BuildContext context, String content) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20.0),
    color: MyColors.black,
    child: Text(
      content,
      style: MyStyle.regular12(context),
      textDirection: TextDirection.rtl,
    ),
  );
}

Widget _topImageWithBack(BuildContext context, String image) {
  return Stack(
    children: [
      CachedNetworkImage(
        imageUrl: image,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
        fit: BoxFit.cover,
        errorWidget:
            (_, __, ___) =>
                const Center(child: Icon(Icons.error, color: Colors.red)),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: MyColors.grey,
              minimumSize: const Size(30, 30),
            ),
            iconSize: 20,
            icon: const Icon(Icons.arrow_back_ios, color: MyColors.white),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
      ),
    ],
  );
}

Widget _overlayContent(BuildContext context, NewsModel news) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF1E1F18).withAlpha(0),
          MyColors.darkGrey.withValues(alpha: .9),
          MyColors.darkGrey,
        ],
      ),
    ),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          news.title,
          style: MyStyle.title23(context),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 10),
        Text.rich(
          textDirection: TextDirection.rtl,
          TextSpan(
            locale: const Locale('ar'),
            children: [
              TextSpan(text: 'المصدر: ', style: MyStyle.semi9(context)),
              TextSpan(text: news.author, style: MyStyle.regular10(context)),
            ],
          ),
        ),
        const Divider(color: MyColors.white, thickness: 0.5),
        Text(
          'Published on ${news.publishDate}',
          style: MyStyle.regular10(context),
        ),
      ],
    ),
  );
}
