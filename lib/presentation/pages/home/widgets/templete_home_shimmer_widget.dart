import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';

class TemepleteHomeShimmerWidget extends StatelessWidget {
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
              CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (_, value, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.5),
                    highlightColor: Colors.grey.withOpacity(0.3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      height: Get.height.percent(10),
                    ),
                  );
                },
                options: carouselOptions,
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: Get.height.percent(33),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (_, index) {
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
              SizedBox(height: 20),
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
              Container(
                width: Get.width,
                height: Get.height.percent(28),
                child: ListView.builder(
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
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
              SizedBox(height: 20),
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
              Container(
                width: Get.width,
                height: Get.height.percent(30),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
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
              SizedBox(height: 20),
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
              Container(
                width: Get.width,
                height: Get.height.percent(30),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
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
              SizedBox(height: 20),
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
              Container(
                width: Get.width,
                height: Get.height.percent(25),
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
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
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
