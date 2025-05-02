import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/themes/text_style.dart';
import 'package:news/core/utils/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello Anderson', style: MyStyle.title18(context)),
            Text('Have a nice day', style: MyStyle.regular12(context)),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).colorScheme.onSurface,
          child: CircleAvatar(
            radius: 23,
            backgroundImage: CachedNetworkImageProvider(Constants.appbarAvatar),
          ),
        ),
      ],
    );
  }
}
