// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../lang/lang.dart';

// class TranslationService extends Translations {
//   static Locale get locale {
//     if (GetStorage().hasData("Defaultlang")) {
//       final locale = GetStorage().read("Defaultlang") as Map;
//       return Locale(locale["codeLang"], locale["code"]);
//     }
//     return Get.deviceLocale!;
//   }

//   static final fallbackLocale = Locale('en', 'US');

//   @override
//   Map<String, Map<String, String>> get keys => {
//         'en_US': en_US,
//         'pt_BR': pt_BR,
//         'es_ES': es_ES,
//         'fr_FR': fr_FR,
//         'ru_RU': ru_RU,
//         'zh_CN': zh_CN,
//         'de_DE': de_DE,
//       };
// }
