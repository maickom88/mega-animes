import 'build_bindings.dart';

import '../../domain/usecases/usecases.dart';

GetVideoEpisodeUsecase buildGetVideoEpisodeUsecase() =>
    GetVideoEpisodeUsecase(buildWebScraperRepository());
