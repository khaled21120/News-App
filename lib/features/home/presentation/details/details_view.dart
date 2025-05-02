import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news/core/themes/light_theme.dart';
import 'package:news/core/themes/text_style.dart';
import 'package:news/features/home/data/model/news_model.dart';

import '../../cubit/cubit/news_cubit.dart';

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
              slivers: [
                SliverFillRemaining(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _backgroundImage(context, image: news.image),
                      _buttons(context),
                      _overlay(context, news: news),
                      _content(context, content: news.text),
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

Widget _buttons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Align(
      alignment: Alignment.topLeft,
      child: IconButton.filled(
        style: IconButton.styleFrom(
          backgroundColor: MyColors.grey,
          minimumSize: Size(30, 30),
        ),
        iconSize: 20,
        icon: const Icon(Icons.arrow_back_ios, color: MyColors.white),
        onPressed: () {
          GoRouter.of(context).pop();
        },
      ),
    ),
  );
}

Widget _content(BuildContext context, {required String content}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: MyColors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Text(
            textDirection: TextDirection.rtl,
            content,
            style: MyStyle.regular12(context),
          ),
        ),
      ),
    ),
  );
}

Widget _overlay(BuildContext context, {required NewsModel news}) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textDirection: TextDirection.rtl,
              news.title,
              style: MyStyle.title23(context),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'By ', style: MyStyle.semi9(context)),
                  TextSpan(
                    text: news.author,
                    style: MyStyle.regular10(context),
                  ),
                ],
              ),
            ),
            const Divider(color: MyColors.white, thickness: .5),
            Text(
              'Publised on ${news.publishDate}',
              style: MyStyle.regular10(context),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _backgroundImage(BuildContext context, {required String image}) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: CachedNetworkImage(
      alignment: Alignment.topCenter,
      imageUrl: image,
      fit: BoxFit.contain,
      height: MediaQuery.of(context).size.height * 0.5,
    ),
  );
}
