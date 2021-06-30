import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_animes/core/constants/constants.dart';

import '../../core/extensions/extensions.dart';

class CardAnimeComponent extends StatelessWidget {
  final String image;
  final String title;
  final String url;
  final String rate;
  final String heroCode;
  final String year;
  final VoidCallback update;

  const CardAnimeComponent({
    Key? key,
    required this.update,
    required this.heroCode,
    required this.year,
    required this.image,
    required this.title,
    required this.url,
    required this.rate,
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
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          width: Get.width.percent(35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: double.infinity,
                  child: Hero(
                    tag: heroCode,
                    child: ExtendedImage.network(
                      image,
                      fit: BoxFit.cover,
                      cache: true,
                      timeRetry: Duration(minutes: 25),
                      handleLoadingProgress: true,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text.rich(
                    TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 13),
                      children: [
                        TextSpan(text: title),
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                        ),
                        TextSpan(text: rate),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
