import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mega_animes/core/constants/routes_consts.dart';

import '../../../../core/extensions/extensions.dart';

class CardWithTimeWatchWidget extends StatelessWidget {
  final String image;
  final String time;
  final String url;
  final String numberSeanson;
  final String numberEpisode;
  final int percent;
  final VoidCallback update;
  const CardWithTimeWatchWidget({
    Key? key,
    required this.update,
    required this.percent,
    required this.image,
    required this.time,
    required this.url,
    required this.numberSeanson,
    required this.numberEpisode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(RoutesConsts.player, arguments: {
          "urlEp": url,
          "image": image,
          "episode": numberEpisode,
          "seanson": numberSeanson,
        });

        update.call();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
        child: Container(
          width: Get.width.percent(38),
          height: Get.width.percent(30) * 1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: ExtendedNetworkImageProvider(
                image,
                cache: true,
                timeRetry: Duration(minutes: 25),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                width: double.infinity,
                height: Get.height.percent(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: 10,
                          child: Stack(
                            children: [
                              Container(
                                width: Get.width.percent(38),
                                height: 8,
                                color: Colors.grey,
                              ),
                              Container(
                                width: Get.width
                                    .percent(38)
                                    .percent(percent.toDouble()),
                                height: 8,
                                color: Colors.red,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "T$numberSeanson:E${numberEpisode.split(' - ').last}",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.play_circle_outline,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
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
