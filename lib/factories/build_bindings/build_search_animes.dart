import '../../domain/usecases/usecases.dart';
import 'build_bindings.dart';

SearchAnimesUsecases buildSearchAnimesUsecases() =>
    SearchAnimesUsecases(buildWebScraperRepository());
