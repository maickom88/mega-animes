import 'package:get/get.dart';
import '../../factories/build_bindings/build_bindings.dart';
import '../../presentation/pages/player/player.dart';

class PlayerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlayerController(
      getVideoEpisode: buildGetVideoEpisodeUsecase(),
    ));
  }
}
