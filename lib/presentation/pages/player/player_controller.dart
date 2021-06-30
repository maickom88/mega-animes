import 'package:get_storage/get_storage.dart';
import 'package:mega_animes/core/errors/errors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

import '../../../domain/usecases/usecases.dart';

class PlayerController extends GetxController {
  final GetVideoEpisodeUsecase getVideoEpisode;
  PlayerController({
    required this.getVideoEpisode,
  });

  Failure? failure;

  String? urlEpisode;
  String? urlVideo;
  Duration? initialDuration;
  Map<String, dynamic>? infoAnime;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  @override
  void onClose() async {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    setAnimeInRecentWatch();
    super.onClose();
  }

  recoveryDurationEpisode() {
    initialDuration = null;
    List<dynamic> recents = [];
    if (GetStorage().hasData("recents")) {
      recents = GetStorage().read("recents");
      recents.forEach((element) {
        if (element["urlEp"] == infoAnime!["urlEp"]) {
          initialDuration = Duration(
            hours: int.parse(element!["hours"] ?? "0"),
            minutes: int.parse(element!["minutes"] ?? "0"),
            seconds: int.parse(element!["seconds"] ?? "0"),
          );
          return;
        }
      });
    }
  }

  Future<void> setAnimeInRecentWatch() async {
    final duration = await videoPlayerController!.position;
    final totalDuration = videoPlayerController!.value.duration;
    infoAnime!["minutes"] = duration?.inMinutes.toString();
    infoAnime!["seconds"] = duration?.inSeconds.toString();
    infoAnime!["hours"] = duration?.inHours.toString();
    infoAnime!["maxMinutes"] = totalDuration.inMinutes.toString();
    infoAnime!["maxSeconds"] = totalDuration.inSeconds.toString();
    infoAnime!["maxHours"] = totalDuration.inHours.toString();
    infoAnime!["maxHours"] = totalDuration.inHours.toString();

    List<dynamic> recents = [];
    if (GetStorage().hasData("recents")) {
      recents = GetStorage().read("recents");

      if (recents.length > 10) {
        recents.removeAt(recents.lastIndexOf(recents.last));
      }
      recents.removeWhere((element) => element["urlEp"] == infoAnime!["urlEp"]);
      recents.insert(0, infoAnime!);
      GetStorage().write("recents", recents);
    } else {
      recents.insert(0, infoAnime!);
      GetStorage().write("recents", recents);
    }
    print(recents);
  }

  @override
  void onInit() {
    urlEpisode = Get.arguments["urlEp"];
    infoAnime = Get.arguments;
    recoveryDurationEpisode();
    getVideoAnime();
    super.onInit();
  }

  Future<void> getVideoAnime() async {
    failure = null;
    final result = await getVideoEpisode(urlEpisode!);
    result.fold((l) {
      failure = l;
      update();
    }, (r) {
      urlVideo = r;
      initializePlayer(r);
    });
  }

  Future<void> initializePlayer(String urlVideo) async {
    failure = null;
    videoPlayerController = VideoPlayerController.network(urlVideo);

    await Future.wait([videoPlayerController!.initialize()]);
    if (initialDuration != null) {
      videoPlayerController?.seekTo(initialDuration!);
    }
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
    );
    update();
  }
}
