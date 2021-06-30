import 'package:easy_debounce/easy_debounce.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../../../core/extensions/extensions.dart';
import '../../../core/constants/constants.dart';
import '../nav/nav.dart';

import 'widgets/widgets.dart';
import 'home.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      extendBody: true,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            Visibility(
              replacement: TemepleteHomeShimmerWidget(),
              visible: !controller.loadPage.value,
              child: InitialHomeNav(
                animesEntity: controller.animes,
                recentsAnimes: controller.recentsAnimesWatch ?? [],
                favoriteAnimes: controller.favoriteAnimes ?? [],
                controller: controller,
              ),
            ),
            Obx(
              () => Visibility(
                replacement: TemepleteSearchShimmerWidget(),
                visible: !controller.loadPage.value,
                child: SearchPageNav(
                  genders: controller.genders,
                  callbackText: (text) {
                    controller.search.value = text;
                    EasyDebounce.debounce(
                        'searchDebouce',
                        Duration(
                            seconds: controller.search.value.contains("genero")
                                ? 0
                                : 1), () {
                      if (controller.search.value.isNotEmpty) {
                        controller.getSearchAnimes(controller.search.value);
                      }
                    });
                  },
                  animes: controller.animesSearch,
                  load: controller.load.value,
                  onError: controller.failures,
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: !controller.loadPage.value,
                child: FavoritePage(
                  controller: controller,
                  favoriteAnimes: controller.favoriteAnimes ?? [],
                ),
              ),
            ),
            SettingsPageNav()
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(context),
    );
  }

  Padding buildBottomNav(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 70, sigmaY: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Obx(
                () => Stack(
                  children: [
                    AnimatedPositioned(
                      left: Get.width.percent(
                        controller.rangeSelectedIndex.value.toDouble(),
                      ),
                      bottom: 0,
                      top: 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceInOut,
                      child: Container(
                        width: 95,
                        height: 80,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.ac_unit,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomIconPressedWidget(
                          icon: FontAwesomeIcons.home,
                          tap: () => controller.changeIndexPage(0),
                        ),
                        BottomIconPressedWidget(
                          icon: FontAwesomeIcons.search,
                          tap: () => controller.changeIndexPage(1),
                        ),
                        BottomIconPressedWidget(
                          icon: FontAwesomeIcons.solidHeart,
                          tap: () => controller.changeIndexPage(2),
                        ),
                        BottomIconPressedWidget(
                          icon: FontAwesomeIcons.cog,
                          tap: () => controller.changeIndexPage(3),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      title: Image.asset(
        PathImagesConst.logo,
        height: 16,
      ),
    );
  }
}
