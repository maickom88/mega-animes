import 'entities.dart';

class AnimesEntity {
  final List<AnimeEntity> popularAnimes;
  final List<AnimeEntity> recentAnimes;
  final List<PosterEntity> lastEpisodes;

  AnimesEntity({
    required this.popularAnimes,
    required this.recentAnimes,
    required this.lastEpisodes,
  });
}
