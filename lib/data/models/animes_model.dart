import '../../domain/entities/entities.dart';
import 'models.dart';

class AnimesModel extends AnimesEntity {
  final List<AnimeModel> popularAnimes;
  final List<AnimeModel> recentAnimes;
  final List<PosterModel> lastEpisodes;

  AnimesModel({
    required this.lastEpisodes,
    required this.popularAnimes,
    required this.recentAnimes,
  }) : super(
          popularAnimes: popularAnimes,
          recentAnimes: recentAnimes,
          lastEpisodes: lastEpisodes,
        );
}
