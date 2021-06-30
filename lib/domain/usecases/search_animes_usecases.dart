import 'package:dartz/dartz.dart';

import '../../core/errors/errors.dart';
import '../../core/usecases/usecase.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class SearchAnimesUsecases implements Usecase<String?, List<AnimeEntity>> {
  final ScrapingRepository repository;

  SearchAnimesUsecases(this.repository);

  @override
  Future<Either<Failure, List<AnimeEntity>>> call(String? input) async {
    return await repository.searchAnimes(input);
  }
}
