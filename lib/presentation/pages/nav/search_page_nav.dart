import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mega_animes/factories/build_ad/build_ad.dart';
import 'package:uuid_type/uuid_type.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/errors/errors.dart';
import '../../components/components.dart';

class SearchPageNav extends StatelessWidget {
  final List<GenderEntity> genders;
  final List<AnimeEntity> animes;
  final Function(String) callbackText;
  final List<Failure> onError;

  final bool load;

  const SearchPageNav({
    Key? key,
    required this.onError,
    required this.load,
    required this.animes,
    required this.callbackText,
    required this.genders,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              child: TextField(
                onChanged: (text) {
                  callbackText(text);
                },
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.white,
                    size: 15,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Buscar anime...",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            SizedBox(height: 15),
            buildListAnimes()
          ],
        ),
      ),
    );
  }

  Column buildListAnimes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleComponent(
          title: 'ANIMES POR',
          titleAction: 'GÊNEROS',
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: genders
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          callbackText(e.url);
                        },
                        child: Text(e.gender),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SizedBox(height: 20),
        TitleComponent(
          title: 'LISTA DE',
          titleAction: 'ANIMES',
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 120,
          padding: EdgeInsets.all(20),
          child: AdWidget(
            ad: buildBannerAd(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Visibility(
            replacement: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 0.7,
              children: List.generate(
                15,
                (int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13, vertical: 15),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.5),
                      highlightColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: Get.width.percent(38),
                        height: Get.width.percent(30) * 1.5,
                      ),
                    ),
                  );
                },
              ),
            ),
            visible: !load,
            child: Builder(builder: (_) {
              if (onError.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      onError.first.getMessage!,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }

              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.7,
                children: List.generate(
                  animes.length,
                  (int index) {
                    final guid = TimeUuidGenerator().generate().toString();
                    final anime = animes[index];
                    return CardAnimeComponent(
                      image: anime.image,
                      rate: anime.rate,
                      title: anime.title,
                      url: anime.url,
                      year: anime.year,
                      heroCode: guid,
                      update: () {},
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
