import '../../domain/usecases/usecases.dart';
import 'build_bindings.dart';

GetDetailsAnimeUsecase buildGetDetailsAnimeUsecase() =>
    GetDetailsAnimeUsecase(buildWebScraperRepository());
