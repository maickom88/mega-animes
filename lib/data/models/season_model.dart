import 'package:mega_animes/data/models/models.dart';
import 'package:mega_animes/domain/entities/entities.dart';

class SeasonModel extends SeasonEntity {
  final String numberSeason;
  final String season;
  final List<EpisodeModel> episodes;
  final int totalSeansons;

  SeasonModel({
    required this.totalSeansons,
    required this.episodes,
    required this.numberSeason,
    required this.season,
  }) : super(
            numberSeason: numberSeason,
            season: season,
            episodes: episodes,
            totalSeansons: totalSeansons);
}
