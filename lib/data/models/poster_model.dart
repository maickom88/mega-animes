import 'package:mega_animes/domain/entities/entities.dart';

class PosterModel extends PosterEntity {
  final String image;
  final String traduction;
  final String url;
  final String title;

  PosterModel({
    required this.image,
    required this.traduction,
    required this.url,
    required this.title,
  }) : super(
          image: image,
          url: url,
          traduction: traduction,
          title: title,
        );

  @override
  String toString() {
    print("$image - $traduction - $url - $title");
    return super.toString();
  }
}
