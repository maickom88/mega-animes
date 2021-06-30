import 'package:get/get.dart';

import '../../presentation/pages/splash_screen/splash_screen.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
