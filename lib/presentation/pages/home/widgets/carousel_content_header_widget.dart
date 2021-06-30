import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_animes/core/constants/constants.dart';

import '../../../../core/extensions/extensions.dart';

class CarouselContentHeaderWidget extends StatelessWidget {
  final String image;
  final String url;
  final String title;
  final String rate;
  final String heroCode;
  final String year;
  final VoidCallback update;
  const CarouselContentHeaderWidget({
    Key? key,
    required this.update,
    required this.image,
    required this.title,
    required this.rate,
    required this.heroCode,
    required this.year,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(RoutesConsts.details, arguments: {
          "image": image,
          "title": title,
          "url": url,
          "rate": rate,
          "heroCode": heroCode,
          "year": year,
        });

        update.call();
      },
      child: Container(
        width: double.infinity,
        height: Get.height.percent(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: heroCode,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
