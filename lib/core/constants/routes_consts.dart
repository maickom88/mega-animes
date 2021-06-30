class RoutesConsts {
  static Future<String> get initialRoute async {
    // if (GetStorage().hasData("saw_the_introduction")) {
    //   return home;
    // }
    return splashScreen;
  }

  static const String home = "/home";

  static const String details = "/details";

  static const String player = "/player";

  static const String splashScreen = "/splash-screen";
}
