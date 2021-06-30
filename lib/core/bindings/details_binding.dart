import 'package:get/get.dart';

import '../../factories/build_bindings/build_bindings.dart';
import '../../presentation/pages/details/details.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController(getDetailsAnime: buildGetDetailsAnimeUsecase()));
  }
}
