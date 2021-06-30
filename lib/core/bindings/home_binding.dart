import 'package:get/get.dart';

import '../../factories/build_bindings/build_bindings.dart';
import '../../presentation/pages/home/home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(
        getInitialAnimes: buildGetInitialAnimes(),
        getGender: buildGenderUsecase(),
        searchAnimes: buildSearchAnimesUsecases(),
      ),
    );
  }
}
