import 'package:mega_animes/domain/entities/entities.dart';

class EpisodeModel extends EpisodeEntity {
  final String image;
  final String episode;
  final String numberEpisode;
  final String date;
  final String url;

  EpisodeModel({
    required this.image,
    required this.episode,
    required this.numberEpisode,
    required this.date,
    required this.url,
  }) : super(
          date: date,
          image: image,
          episode: episode,
          url: url,
          numberEpisode: numberEpisode,
        );
}
