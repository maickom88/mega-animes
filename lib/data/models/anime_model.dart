import '../../domain/entities/entities.dart';

class AnimeModel extends AnimeEntity {
  final String title;
  final String year;
  final String rate;
  final String url;
  final String image;

  AnimeModel({
    required this.title,
    required this.image,
    required this.year,
    required this.rate,
    required this.url,
  }) : super(title: title, year: year, rate: rate, url: url, image: image);

  @override
  String toString() {
    print("$title - $image - $rate - $year - $url");
    return super.toString();
  }
}
