import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../core/errors/errors.dart';
import '../../../factories/build_ad/build_ad.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';
import '../../../core/usecases/usecase.dart';

class HomeController extends GetxController {
  final GetInitialAnimes getInitialAnimes;
  final GetGender getGender;
  final SearchAnimesUsecases searchAnimes;

  HomeController({
    required this.getInitialAnimes,
    required this.searchAnimes,
    required this.getGender,
  });

  final selectedIndex = 0.obs;
  final rangeSelectedIndex = (-4).obs;
  RxList<AnimesEntity> animes = <AnimesEntity>[].obs;
  RxList<AnimeEntity> animesSearch = <AnimeEntity>[].obs;
  RxList<GenderEntity> genders = <GenderEntity>[].obs;
  RxBool load = false.obs;
  RxBool loadPage = false.obs;
  RxString search = ''.obs;
  RxList<Failure> failures = <Failure>[].obs;

  List<dynamic>? recentsAnimesWatch;
  List<dynamic>? favoriteAnimes;

  InterstitialAd myInterstitial = buildInterstitialAd();

  @override
  Future<void> onInit() async {
    openLoadPage();
    getRecentesAnimesWatch();
    getFavoriteAnimes();
    await getSearchAnimes(null);
    await getAnimes();
    await getGenders();
    closeLoadPage();

    super.onInit();
  }

  void changeIndexPage(int index) {
    checkIndexAndChangeRange(index);
    selectedIndex.value = index;
    debugPrint("PAGINA ATUAL: $index");
  }

  getRecentesAnimesWatch() {
    if (GetStorage().hasData("recents")) {
      recentsAnimesWatch = GetStorage().read("recents");
    } else {
      recentsAnimesWatch = [];
    }
  }

  getFavoriteAnimes() {
    if (GetStorage().hasData("favorites")) {
      favoriteAnimes = GetStorage().read("favorites");
    } else {
      favoriteAnimes = [];
    }
  }

  setUpdate() {
    loadPage.value = true;
    getRecentesAnimesWatch();
    getFavoriteAnimes();
    loadPage.value = false;

    update();
  }

  Future<void> removeRecentesAnimes() async {
    await GetStorage().remove("recents");

    Get.snackbar(
      "Removido",
      "Você deletou todos os animes recentes",
      colorText: Colors.white,
    );
    setUpdate();
  }

  Future<void> removeFavoriteAnimes() async {
    await GetStorage().remove("favorites");
    Get.snackbar(
      "Removido",
      "Você deletou todos os animes favoritos",
      colorText: Colors.white,
    );
    setUpdate();
  }

  int calculatePercentTime(dynamic map) {
    final minutes = map["minutes"];
    final seconds = map["seconds"];
    final hours = map["hours"];

    final maxMinutes = map["maxMinutes"];
    final maxSeconds = map["maxSeconds"];
    final maxHours = map["maxHours"];
    final maxDuration = Duration(
        seconds: int.parse(maxSeconds),
        hours: int.parse(maxHours),
        minutes: int.parse(maxMinutes));
    final duration = Duration(
        seconds: int.parse(seconds),
        hours: int.parse(hours),
        minutes: int.parse(minutes));

    final maxValueDuration =
        double.parse(maxDuration.toString().replaceAll(":", ""));
    final valueDuration = double.parse(duration.toString().replaceAll(":", ""));

    try {
      return int.parse(
          (((maxValueDuration - valueDuration) / maxValueDuration) * 100 - 100)
              .abs()
              .toStringAsFixed(0));
    } catch (e) {
      return 0;
    }
  }

  void checkIndexAndChangeRange(int index) {
    if (index == 0) rangeSelectedIndex.value = -4;
    if (index == 1) rangeSelectedIndex.value = -4 + 26;
    if (index == 2) rangeSelectedIndex.value = (-4 + 26) + 25;
    if (index == 3) rangeSelectedIndex.value = (-4 + 26) + 25 + 25;
  }

  Future<void> getAnimes() async {
    final params = NoParams();
    final result = await getInitialAnimes(params);
    result.fold((l) {}, (r) {
      animes.add(r);
    });
  }

  Future<void> getGenders() async {
    final params = NoParams();
    final result = await getGender(params);
    result.fold((l) {}, (r) {
      genders.value = r;
    });
  }

  Future<void> getSearchAnimes(String? text) async {
    openLoad();
    failures.clear();
    final result = await searchAnimes(text);
    result.fold((l) {
      failures.add(l);
    }, (r) {
      animesSearch.value = r;
    });
    closeLoad();
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
  }

  void openLoad() => load.value = true;
  void closeLoad() => load.value = false;
  void openLoadPage() => loadPage.value = true;
  void closeLoadPage() => loadPage.value = false;
}
