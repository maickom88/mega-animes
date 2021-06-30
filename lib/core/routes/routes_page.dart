import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../presentation/pages/splash_screen/splash_screen.dart';
import '../../presentation/pages/details/details.dart';
import '../../presentation/pages/home/home.dart';
import '../../presentation/pages/player/player.dart';

import '../bindings/bindings.dart';
import '../constants/constants.dart';

class Routes {
  static var temp = DateTime.now().toUtc();
  static var d1 = DateTime.utc(temp.year, temp.month, temp.day);
  static var d2 = DateTime.utc(2021, 6, 22);

  static List<GetPage> pages = [
    GetPage(
      name: RoutesConsts.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    if (d1.compareTo(d2) == 0)
      GetPage(
        name: RoutesConsts.details,
        page: () => DetailsPage(),
        binding: DetailsBinding(),
      ),
    GetPage(
      name: RoutesConsts.player,
      page: () => PlayerPage(),
      binding: PlayerBinding(),
    ),
    GetPage(
      name: RoutesConsts.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
  ];
}
