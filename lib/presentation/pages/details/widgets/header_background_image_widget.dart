import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';

class HeaderBackgroundImageWidget extends StatelessWidget {
  final String image;
  final String hero;

  const HeaderBackgroundImageWidget({
    required this.image,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height.percent(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Hero(
                tag: hero,
                child: image.contains("/assets/")
                    ? Image.asset(
                        image,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      )
                    : ExtendedImage.network(
                        image,
                        cache: true,
                        timeRetry: Duration(minutes: 25),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
