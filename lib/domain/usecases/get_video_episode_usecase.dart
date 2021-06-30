import 'package:dartz/dartz.dart';

import '../../core/usecases/usecase.dart';
import '../../core/errors/errors.dart';
import '../repositories/repositories.dart';

class GetVideoEpisodeUsecase implements Usecase<String, String> {
  final ScrapingRepository repository;

  GetVideoEpisodeUsecase(this.repository);
  @override
  Future<Either<Failure, String>> call(String input) async {
    return await repository.getVideoAnime(input);
  }
}
