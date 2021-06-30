import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/extensions.dart';

class TemepleteSearchShimmerWidget extends StatelessWidget {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    width: double.infinity,
                    height: Get.height.percent(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
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
                height: Get.height.percent(10),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GridView.count(
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
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
