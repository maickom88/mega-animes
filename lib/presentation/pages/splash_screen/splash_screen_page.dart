import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_animes/core/constants/constants.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

import 'splash_screen.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: SplashScreen.callback(
        name: 'lib/assets/animations/animate.riv',
        onSuccess: (data) {
          Get.offAllNamed(RoutesConsts.home);
        },
        onError: (err, stack) {
          print("Error ao carregar $err");
        },
        loopAnimation: 'animate',
        until: () => Future.delayed(
          Duration(seconds: 1),
        ),
      ),
    );
  }
}
