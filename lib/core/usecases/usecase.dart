import 'package:dartz/dartz.dart';

import '../errors/errors.dart';

abstract class Usecase<I, O> {
  Future<Either<Failure, O>> call(I input);
}

class NoParams {}
