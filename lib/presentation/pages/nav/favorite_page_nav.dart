import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mega_animes/factories/build_ad/build_ad.dart';
import 'package:mega_animes/presentation/pages/home/home.dart';
import 'package:uuid_type/uuid_type.dart';

import '../../components/components.dart';

class FavoritePage extends StatelessWidget {
  final List favoriteAnimes;
  final HomeController controller;

  const FavoritePage({
    Key? key,
    required this.favoriteAnimes,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.all(20),
            child: AdWidget(
              ad: buildBannerAd(
                  size: AdSize(height: 200, width: Get.width.toInt())),
            ),
          ),
          Center(
            child: Text("Você não possui animes salvos!"),
          )
        ],
      ),
      visible: favoriteAnimes.isNotEmpty,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleComponent(
              title: 'MINHA',
              titleAction: 'LISTA',
            ),
            Container(
              width: double.infinity,
              height: 200,
              padding: EdgeInsets.all(20),
              child: AdWidget(
                ad: buildBannerAd(size: AdSize.fullBanner),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: favoriteAnimes.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return CardFavoriteListComponent(
                  url: favoriteAnimes[index]["url"],
                  image: favoriteAnimes[index]["image"],
                  heroCode: TimeUuidGenerator().generate().toString(),
                  rate: favoriteAnimes[index]["rate"],
                  title: favoriteAnimes[index]["title"],
                  update: () => controller.setUpdate(),
                  year: favoriteAnimes[index]["year"],
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
