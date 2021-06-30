import '../models/models.dart';

abstract class ScrapingDatasource {
  Future<AnimesModel> getAnimes();
  Future<List<AnimeModel>> searchAnimes(String? input);
  Future<List<GenderModel>> getGender();
  Future<DetailsAnimeModel> getDetailsAnime(String input);
  Future<String> getVideoAnime(String input);
}
