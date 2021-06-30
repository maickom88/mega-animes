import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mega_animes/core/constants/constants.dart';
import 'package:mega_animes/factories/build_ad/build_ad.dart';
import 'package:uuid_type/uuid_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/extensions/extensions.dart';
import '../../../domain/entities/entities.dart';
import '../../components/components.dart';
import '../home/widgets/widgets.dart';
import '../home/home.dart';

class InitialHomeNav extends StatelessWidget {
  final List<AnimesEntity> animesEntity;
  final List<dynamic> recentsAnimes;
  final List<dynamic> favoriteAnimes;
  final HomeController controller;
  const InitialHomeNav({
    Key? key,
    required this.controller,
    required this.recentsAnimes,
    required this.animesEntity,
    required this.favoriteAnimes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carouselOptions = CarouselOptions(
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.8,
      aspectRatio: 2.0,
      initialPage: 2,
    );
    final linearGradient = LinearGradient(
      colors: [
        Color(0xff1E1E1E),
        Color(0xff1E1E1E),
        Color(0xFF2C2C2C),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: linearGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CarouselSlider(
                options: carouselOptions,
                items: [
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.bokuNoHeroPoster,
                    url: "https://animesonline.cc/anime/boku-no-hero-academia/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '8.2',
                    title: 'Boku no Hero',
                    year: '2016',
                    update: () => controller.setUpdate(),
                  ),
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.dragonBallPoster,
                    url: "https://animesonline.cc/anime/dragon-ball-super-hd/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '8.4',
                    title: 'Dragon Ball Super Dublado',
                    year: '2015',
                    update: () => controller.setUpdate(),
                  ),
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.deathNotePoster,
                    url: "https://animesonline.cc/anime/death-note/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '8.3',
                    title: 'Death Note',
                    year: '2006',
                    update: () => controller.setUpdate(),
                  ),
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.dragonsDogmasPoster,
                    url: "https://animesonline.cc/anime/dragons-dogma/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '6.7',
                    title: 'Dragon’s Dogma',
                    year: '2020',
                    update: () => controller.setUpdate(),
                  ),
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.nanatsuNoTaizaiPoster,
                    url: "https://animesonline.cc/anime/nanatsu-no-taizai-hd/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '8.0',
                    title: 'Nanatsu no Taizai ',
                    year: '2014',
                    update: () => controller.setUpdate(),
                  ),
                  CarouselContentHeaderWidget(
                    image: PathImagesConst.narutoPoster,
                    url: "https://animesonline.cc/anime/naruto-shippuden/",
                    heroCode: TimeUuidGenerator().generate().toString(),
                    rate: '8.1',
                    title: 'Naruto Shippuden',
                    year: '2007',
                    update: () => controller.setUpdate(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 120,
                padding: EdgeInsets.all(20),
                child: AdWidget(ad: buildBannerAd()),
              ),
              Visibility(
                visible: recentsAnimes.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleComponent(
                      title: 'CONTINUE',
                      titleAction: 'ASSISTINDO',
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: Get.height.percent(33),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: recentsAnimes.length,
                        itemBuilder: (_, index) {
                          final anime = recentsAnimes[index];
                          return CardWithTimeWatchWidget(
                            image: anime["image"],
                            numberEpisode: anime["episode"],
                            numberSeanson: anime["seanson"].toString(),
                            time: '',
                            url: anime["urlEp"],
                            percent: controller.calculatePercentTime(anime),
                            update: () => controller.setUpdate(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (_) => Visibility(
                  visible: favoriteAnimes.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleComponent(
                        title: 'MINHA',
                        titleAction: 'LISTA',
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height.percent(28),
                        child: ListView.builder(
                          itemCount: favoriteAnimes.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, index) {
                            return CardFavoriteListComponent(
                              url: favoriteAnimes[index]["url"],
                              image: favoriteAnimes[index]["image"],
                              heroCode:
                                  TimeUuidGenerator().generate().toString(),
                              rate: favoriteAnimes[index]["rate"],
                              title: favoriteAnimes[index]["title"],
                              update: () => controller.setUpdate(),
                              year: favoriteAnimes[index]["year"],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              TitleComponent(
                title: 'ANIMES',
                titleAction: 'POPULARES',
              ),
              Container(
                width: Get.width,
                height: Get.height.percent(30),
                child: ListView.builder(
                  itemCount: animesEntity[0].popularAnimes.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final popularAnimes = animesEntity[0].popularAnimes[index];
                    final guid = TimeUuidGenerator().generate().toString();
                    return CardAnimeComponent(
                      image: popularAnimes.image,
                      rate: popularAnimes.rate,
                      title: popularAnimes.title,
                      url: popularAnimes.url,
                      year: popularAnimes.year,
                      heroCode: guid,
                      update: () => controller.setUpdate(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              TitleComponent(
                title: 'ANIMES',
                titleAction: 'RECENTES',
              ),
              Container(
                width: Get.width,
                height: Get.height.percent(30),
                child: ListView.builder(
                  itemCount: animesEntity[0].recentAnimes.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final recentAnimes = animesEntity[0].recentAnimes[index];
                    final guid = TimeUuidGenerator().generate().toString();
                    return CardAnimeComponent(
                      image: recentAnimes.image,
                      rate: recentAnimes.rate,
                      title: recentAnimes.title,
                      url: recentAnimes.url,
                      year: recentAnimes.year,
                      heroCode: guid,
                      update: () => controller.setUpdate(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              TitleComponent(
                title: 'EPISÓDIOS',
                titleAction: 'RECENTES',
              ),
              Container(
                width: Get.width,
                height: Get.height.percent(25),
                child: ListView.builder(
                  itemCount: animesEntity[0].lastEpisodes.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final lastEpisodes = animesEntity[0].lastEpisodes[index];
                    return CardRecentEpComponent(
                      image: lastEpisodes.image,
                      title: lastEpisodes.title,
                      url: lastEpisodes.url,
                      heroCode: '',
                      rate: '',
                      update: () => controller.setUpdate(),
                      year: '',
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 120,
                padding: EdgeInsets.all(20),
                child: AdWidget(ad: buildBannerAd()),
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
