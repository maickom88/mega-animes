import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mega_animes/factories/build_ad/build_ad.dart';
import 'package:uuid_type/uuid_type.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../core/errors/errors.dart';

class DetailsController extends GetxController {
  GetDetailsAnimeUsecase getDetailsAnime;
  DetailsController({
    required this.getDetailsAnime,
  });

  ScrollController scrollController = ScrollController();

  RxList<DetailsAnimeEntity> detailsAnime = <DetailsAnimeEntity>[].obs;
  RxList<Failure> failures = <Failure>[].obs;
  RxList<SeasonEntity> actualSeanson = <SeasonEntity>[].obs;
  Map<String, dynamic> arguments = {};
  bool showDescription = true;
  InterstitialAd myInterstitial = buildInterstitialAd();
  @override
  Future<void> onInit() async {
    arguments = Get.arguments;
    loadDetails(arguments["url"]);
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
    super.onInit();
  }

  changeTemp(SeasonEntity seanson) async {
    actualSeanson.clear();
    actualSeanson.add(seanson);
    if (scrollController.hasClients) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    }
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
  }

  bool verifyIfAnimeIsFavorite() {
    if (GetStorage().hasData("favorites")) {
      List<dynamic> favorites = GetStorage().read("favorites");
      final isFavorite =
          favorites.where((e) => e["url"] == arguments["url"]).toList();
      if (isFavorite.isNotEmpty) {
        return true;
      }
    }

    return false;
  }

  Future<void> addFavoriteAnime() async {
    if (GetStorage().hasData("favorites")) {
      List<dynamic> favorites = GetStorage().read("favorites");
      List<bool> isFavorite = [];
      if (favorites.isNotEmpty) {
        isFavorite =
            favorites.map((e) => e["url"] == arguments["url"]).toList();
        if (!isFavorite.last) {
          final favorite = {
            "url": arguments["url"],
            "image": arguments["image"],
            "title": arguments["title"],
            "heroCode": arguments["heroCode"],
            "rate": arguments["rate"],
            "year": arguments["year"],
          };
          favorites.insert(0, favorite);
          await GetStorage().write("favorites", favorites);
        } else {
          favorites
              .removeWhere((element) => element["url"] == arguments["url"]);
          await GetStorage().write("favorites", favorites);
        }
      } else {
        List favorites = [];
        final favorite = {
          "url": arguments["url"],
          "image": arguments["image"],
          "title": arguments["title"],
          "heroCode": arguments["heroCode"],
          "rate": arguments["rate"],
          "year": arguments["year"],
        };
        favorites.insert(0, favorite);
        await GetStorage().write("favorites", favorites);
      }
    } else {
      List favorites = [];
      final favorite = {
        "url": arguments["url"],
        "image": arguments["image"],
        "title": arguments["title"],
        "heroCode": arguments["heroCode"],
        "rate": arguments["rate"],
        "year": arguments["year"],
      };
      favorites.insert(0, favorite);
      await GetStorage().write("favorites", favorites);
    }
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
    update();
  }

  int verifyNumberSeanson() {
    var isNumber = false;
    for (var i = 0; i < detailsAnime.length; i++) {
      for (var y = 0; y < detailsAnime[i].season.length; y++) {
        isNumber =
            detailsAnime[i].season[y].season == actualSeanson.first.season;
      }
      if (isNumber) {
        return (i + 1);
      }
    }
    return 1;
  }

  Future<void> loadDetails(String url) async {
    actualSeanson.value = [];
    final result = await getDetailsAnime(url);
    result.fold((l) {
      print(l);
      failures.add(l);
    }, (r) {
      arguments["image"] = r.image;
      arguments["title"] = r.title;
      arguments["rate"] = r.rate;
      arguments["year"] = r.year;
      arguments["herCode"] = TimeUuidGenerator().generate().toString();
      detailsAnime.add(r);
      changeTemp(r.season.first);
    });
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
    update();
  }

  setUpdateAnime(AnimeEntity anime, String heroCode) async {
    arguments["url"] = anime.url;
    loadDetails(anime.url);
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
  }

  hideInformation() {
    showDescription = !showDescription;
    update();
  }

  showAd() async {
    if (await myInterstitial.isLoaded()) {
      myInterstitial.show();
    } else {
      myInterstitial = buildInterstitialAd();
    }
  }
}
