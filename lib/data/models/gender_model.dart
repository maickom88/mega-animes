import 'package:mega_animes/domain/entities/entities.dart';

class GenderModel extends GenderEntity {
  final String gender;
  final String url;

  GenderModel({
    required this.gender,
    required this.url,
  }) : super(gender: gender, url: url);

  @override
  String toString() {
    print("$gender - $url");
    return super.toString();
  }
}
