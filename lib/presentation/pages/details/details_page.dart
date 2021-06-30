import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid_type/uuid_type.dart';
import '../../../core/extensions/extensions.dart';
import '../../../core/constants/constants.dart';
import '../../components/components.dart';
import 'widgets/widgets.dart';
import 'details.dart';

class DetailsPage extends GetView<DetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            GetBuilder<DetailsController>(
              builder: (_) => HeaderBackgroundImageWidget(
                image: controller.arguments["image"],
                hero: controller.arguments["heroCode"],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: buildAppBar(),
            ),
            GetBuilder<DetailsController>(
                builder: (_) => TitleAnimeHeaderWidget(
                    title: controller.arguments["title"])),
            GetBuilder<DetailsController>(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<DetailsController>(
                    builder: (_) => ActionBarWidget(
                      onLike: () => controller.addFavoriteAnime(),
                      isFavorite: controller.verifyIfAnimeIsFavorite(),
                      anime: controller.arguments["title"],
                      hideInformation: () => controller.hideInformation(),
                      playerTap: () async {
                        final ep =
                            controller.actualSeanson.first.episodes.first;
                        await Get.toNamed(RoutesConsts.player, arguments: {
                          "urlEp": ep.url,
                          "image": controller.detailsAnime.first.image,
                          "episode": ep.numberEpisode,
                          "seanson": controller.actualSeanson.first.season
                              .split(" ")
                              .last,
                        });
                        controller.showAd();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      children: [
                        Text(
                          "${controller.arguments["rate"]} aprovação",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.green),
                        ),
                        SizedBox(width: 15),
                        Text(controller.arguments["year"],
                            style: Theme.of(context).textTheme.headline1),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(() {
                    if (controller.failures.isNotEmpty) {
                      return Center(
                        child: Text("Ops Aconteceu um error"),
                      );
                    }
                    if (controller.actualSeanson.isNotEmpty) {
                      return buildContent(context);
                    }
                    return buildLoadPage();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildLoadPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: Get.width.percent(80),
              height: Get.height.percent(1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: Get.width.percent(80),
              height: Get.height.percent(1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: Get.width.percent(70),
              height: Get.height.percent(1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: Get.width.percent(65),
              height: Get.height.percent(1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: Get.width.percent(50),
              height: Get.height.percent(3),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: Get.height.percent(25),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: Get.width.percent(38),
                    height: Get.width.percent(25),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              width: 150,
              height: Get.height.percent(2),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: Get.height.percent(30),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 8,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: Get.width.percent(35),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: controller.showDescription,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: ReadMoreWidget(
              description: controller.detailsAnime.last.description,
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.dialog(
                  DialogActionChangeSeanson(
                    seasons: controller.detailsAnime.first.season,
                    actualSeason: controller.actualSeanson.first.season,
                    changed: (season) => controller.changeTemp(season),
                  ),
                ),
                child: Container(
                  width: 165,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFF383838),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.actualSeanson.first.season.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 12),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_drop_down, color: Colors.red),
                    ],
                  ),
                ),
              ),
              Text("${controller.actualSeanson.first.episodes.length} EP")
            ],
          ),
        ),
        SizedBox(height: 10),
        GetBuilder<DetailsController>(
          builder: (_) => Padding(
            padding: const EdgeInsets.only(left: 13),
            child: SizedBox(
              width: double.infinity,
              height: Get.width.percent(38),
              child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.actualSeanson.first.episodes.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  final ep = controller.actualSeanson.first.episodes[index];
                  return InkWell(
                    onTap: () async {
                      await Get.toNamed(RoutesConsts.player, arguments: {
                        "urlEp": ep.url,
                        "image": controller.detailsAnime.first.image,
                        "episode": ep.numberEpisode,
                        "seanson": controller.actualSeanson.first.season
                            .split(" ")
                            .last,
                      });

                      controller.showAd();
                    },
                    child: GetBuilder<DetailsController>(
                      builder: (_) =>
                          CardEpDetailsWidget(ep: ep.episode, image: ep.image),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        TitleComponent(
          title: 'ANIMES',
          titleAction: 'RELACIONADOS',
        ),
        GetBuilder<DetailsController>(
          builder: (_) => SizedBox(
            width: double.infinity,
            height: Get.width.percent(50),
            child: ListView.builder(
              itemCount: controller.detailsAnime.first.relationsAnimes.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                final guid = TimeUuidGenerator().generate().toString();
                final anime =
                    controller.detailsAnime.first.relationsAnimes[index];
                return CardFavoriteListComponent(
                  image: anime.image,
                  url: anime.url,
                  heroCode: guid,
                  rate: anime.rate,
                  title: anime.title,
                  updateAnime: true,
                  update: () => controller.setUpdateAnime(anime, guid),
                  year: anime.year,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      title: Image.asset(
        PathImagesConst.logo,
        height: 16,
      ),
    );
  }
}
