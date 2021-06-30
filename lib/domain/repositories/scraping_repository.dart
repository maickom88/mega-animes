import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../../core/errors/errors.dart';

abstract class ScrapingRepository {
  Future<Either<Failure, AnimesEntity>> getAnimes();

  Future<Either<Failure, List<AnimeEntity>>> searchAnimes(String? input);

  Future<Either<Failure, List<GenderEntity>>> getGender();

  Future<Either<Failure, DetailsAnimeEntity>> getDetailsAnime(String input);

  Future<Either<Failure, String>> getVideoAnime(String input);
}
