import 'package:mega_animes/domain/entities/entities.dart';

class SeasonEntity {
  final String numberSeason;
  final String season;
  final List<EpisodeEntity> episodes;
  final int totalSeansons;

  SeasonEntity({
    required this.totalSeansons,
    required this.episodes,
    required this.numberSeason,
    required this.season,
  });
}
