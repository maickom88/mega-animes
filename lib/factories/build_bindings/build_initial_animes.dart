import '../../domain/usecases/usecases.dart';
import 'build_bindings.dart';

GetInitialAnimes buildGetInitialAnimes() =>
    GetInitialAnimes(buildWebScraperRepository());
