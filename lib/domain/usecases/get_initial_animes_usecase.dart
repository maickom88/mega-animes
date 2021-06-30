import 'package:dartz/dartz.dart';

import '../../core/usecases/usecase.dart';
import '../../core/errors/errors.dart';
import '../entities/entities.dart';

import '../repositories/repositories.dart';

class GetInitialAnimes implements Usecase<NoParams, AnimesEntity> {
  final ScrapingRepository repository;

  GetInitialAnimes(this.repository);

  @override
  Future<Either<Failure, AnimesEntity>> call(NoParams input) async =>
      await repository.getAnimes();
}
