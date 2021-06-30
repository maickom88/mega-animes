import 'package:in_app_review/in_app_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../home/home.dart';

import '../../../core/extensions/extensions.dart';

class SettingsPageNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InAppReview inAppReview = InAppReview.instance;
    final homeController = Get.find<HomeController>();
    final images = [
      PathImagesConst.banner01,
      PathImagesConst.banner02,
      PathImagesConst.banner03,
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => homeController.removeRecentesAnimes(),
                icon: Icon(Icons.delete),
                label: Text("Limpar animes recentes"),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => homeController.removeFavoriteAnimes(),
                icon: Icon(Icons.delete),
                label: Text("Limpar animes favoritos"),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton.icon(
                onPressed: () async {
                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  }
                },
                icon: Icon(Icons.star),
                label: Text("Avalie nosso aplicativo"),
              ),
            ),
            SizedBox(height: 40),
            Image.asset(
              PathImagesConst.icon,
              height: 60,
            ),
            SizedBox(width: 10),
            Text("v1.0.1"),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: Get.height.percent(30),
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Container(
                      width: Get.width.percent(80),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 2),
                            blurRadius: 8,
                            color: Colors.black.withOpacity(0.7),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
