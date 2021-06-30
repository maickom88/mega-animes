import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_animes/core/constants/constants.dart';

import '../../core/extensions/extensions.dart';

class CardRecentEpComponent extends StatelessWidget {
  final String image;
  final String title;
  final String url;
  final String rate;
  final String heroCode;
  final String year;
  final VoidCallback update;

  CardRecentEpComponent({
    Key? key,
    required this.update,
    required this.year,
    required this.heroCode,
    required this.rate,
    required this.image,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.toNamed(RoutesConsts.details, arguments: {
          "image": image,
          "title": title,
          "url":
              url.split("episodio")[1].replaceAll(new RegExp(r'-[0-9]*\-'), ""),
          "rate": rate,
          "heroCode": heroCode,
          "year": year,
        });

        update.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: Get.width.percent(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: ExtendedImage.network(
                    image,
                    fit: BoxFit.cover,
                    cache: true,
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
                    child: Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
