import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';

class TitleAnimeHeaderWidget extends StatelessWidget {
  final String title;
  const TitleAnimeHeaderWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 13, right: 13),
      height: 70,
      margin: EdgeInsets.only(top: Get.height.percent(13)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title.toUpperCase(),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
