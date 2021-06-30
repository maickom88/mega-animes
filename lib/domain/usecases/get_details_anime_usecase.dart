import 'package:dartz/dartz.dart';

import '../../core/usecases/usecase.dart';
import '../../core/errors/errors.dart';
import '../repositories/repositories.dart';
import '../entities/entities.dart';

class GetDetailsAnimeUsecase implements Usecase<String, DetailsAnimeEntity> {
  final ScrapingRepository repository;

  GetDetailsAnimeUsecase(this.repository);
  @override
  Future<Either<Failure, DetailsAnimeEntity>> call(String input) async {
    return await repository.getDetailsAnime(input);
  }
}
