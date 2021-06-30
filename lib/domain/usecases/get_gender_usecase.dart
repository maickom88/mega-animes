import 'package:dartz/dartz.dart';

import '../../core/errors/errors.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/repositories.dart';
import '../entities/entities.dart';

class GetGender implements Usecase<NoParams, List<GenderEntity>> {
  final ScrapingRepository repository;

  GetGender(this.repository);

  @override
  Future<Either<Failure, List<GenderEntity>>> call(NoParams input) async =>
      await repository.getGender();
}
