import '../../domain/usecases/usecases.dart';
import 'build_bindings.dart';

GetGender buildGenderUsecase() => GetGender(buildWebScraperRepository());
