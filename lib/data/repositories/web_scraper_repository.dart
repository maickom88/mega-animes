import 'package:dartz/dartz.dart';

import '../../domain/repositories/repositories.dart';
import '../../domain/entities/entities.dart';
import '../../core/errors/errors.dart';
import '../datasources/datasources.dart';

class WebScraperRepository implements ScrapingRepository {
  final ScrapingDatasource scrapingDatasource;

  WebScraperRepository(this.scrapingDatasource);

  @override
  Future<Either<Failure, AnimesEntity>> getAnimes() async {
    try {
      return Right(await scrapingDatasource.getAnimes());
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<GenderEntity>>> getGender() async {
    try {
      return Right(await scrapingDatasource.getGender());
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> searchAnimes(String? input) async {
    try {
      return Right(await scrapingDatasource.searchAnimes(input));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, DetailsAnimeEntity>> getDetailsAnime(
      String input) async {
    try {
      return Right(await scrapingDatasource.getDetailsAnime(input));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> getVideoAnime(String input) async {
    try {
      return Right(await scrapingDatasource.getVideoAnime(input));
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
