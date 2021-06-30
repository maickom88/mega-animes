import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/extensions.dart';
import '../../core/constants/constants.dart';

class CardFavoriteListComponent extends StatelessWidget {
  final String image;
  final String url;
  final String title;
  final String year;
  final String rate;
  final String heroCode;
  final VoidCallback update;
  final bool updateAnime;
  const CardFavoriteListComponent({
    Key? key,
    required this.update,
    required this.title,
    required this.year,
    required this.rate,
    required this.heroCode,
    required this.image,
    required this.url,
    this.updateAnime = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          if (!updateAnime) {
            await Get.toNamed(RoutesConsts.details, arguments: {
              "image": image,
              "title": title,
              "url": url,
              "rate": rate,
              "heroCode": heroCode,
              "year": year,
            });
          }

          update.call();
        },
        child: Container(
          width: Get.width.percent(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image.contains("/assets/")
                ? Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )
                : ExtendedImage.network(
                    image,
                    fit: BoxFit.cover,
                    cache: true,
                    timeRetry: Duration(minutes: 25),
                  ),
          ),
        ),
      ),
    );
  }
}
