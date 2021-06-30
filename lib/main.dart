import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/constants.dart';
// import 'core/services/services.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  final initialRoute = await RoutesConsts.initialRoute;
  runApp(Gtags(initialRoute));
}

class Gtags extends StatelessWidget {
  final String initialRoute;

  const Gtags(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generate Tags',
      theme: ThemeApp.theme(),
      initialRoute: initialRoute,
      getPages: Routes.pages,
      // locale: TranslationService.locale,
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}
