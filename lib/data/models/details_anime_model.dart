import 'models.dart';
import '../../domain/entities/entities.dart';

class DetailsAnimeModel extends DetailsAnimeEntity {
  final List<GenderModel> generos;
  final String description;
  final List<SeasonModel> season;
  final List<AnimeModel> relationsAnimes;
  final String image;
  final String title;
  final String year;
  final String rate;
  final String? url;
  DetailsAnimeModel({
    this.url,
    required this.rate,
    required this.year,
    required this.title,
    required this.image,
    required this.relationsAnimes,
    required this.generos,
    required this.description,
    required this.season,
  }) : super(
          relationsAnimes: relationsAnimes,
          generos: generos,
          description: description,
          season: season,
          title: title,
          image: image,
          rate: rate,
          year: year,
          url: url,
        );
}
