import 'entities.dart';

class DetailsAnimeEntity {
  final List<GenderEntity> generos;
  final String description;
  final String image;
  final String year;
  final String title;
  final String rate;
  final String? url;
  final List<SeasonEntity> season;
  final List<AnimeEntity> relationsAnimes;

  DetailsAnimeEntity({
    this.url,
    required this.rate,
    required this.year,
    required this.title,
    required this.image,
    required this.relationsAnimes,
    required this.generos,
    required this.description,
    required this.season,
  });
}
