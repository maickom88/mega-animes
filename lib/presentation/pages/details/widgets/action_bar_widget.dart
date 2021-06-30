import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';
import 'widgets.dart';

class ActionBarWidget extends StatelessWidget {
  final VoidCallback onLike;
  final VoidCallback hideInformation;
  final VoidCallback playerTap;
  final bool isFavorite;
  final String anime;
  const ActionBarWidget({
    Key? key,
    this.isFavorite = false,
    required this.anime,
    required this.playerTap,
    required this.hideInformation,
    required this.onLike,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: Get.height.percent(25)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: Get.width.percent(80),
        height: Get.height.percent(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(2, 3),
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 0,
              )
            ]),
        child: ButtonIconActionWidget(
          onLike: onLike,
          isFavorite: isFavorite,
          anime: anime,
          hideInformation: hideInformation,
          playTap: playerTap,
        ),
      ),
    );
  }
}
