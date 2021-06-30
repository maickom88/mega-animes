import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/entities.dart';

class DialogActionChangeSeanson extends StatelessWidget {
  final List<SeasonEntity> seasons;
  final String actualSeason;
  final Function(SeasonEntity) changed;
  const DialogActionChangeSeanson({
    Key? key,
    required this.actualSeason,
    required this.changed,
    required this.seasons,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: seasons
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    selectedTileColor: Colors.black,
                    selected: actualSeason == e.season,
                    title: Text(
                      e.season,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    onTap: () {
                      changed(e);
                      Get.back();
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
