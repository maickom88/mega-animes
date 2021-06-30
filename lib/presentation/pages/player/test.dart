import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        'https://r2---sn-qhjuxaxjvhcg-2o1e.googlevideo.com/videoplayback?expire=1619358661&ei=RQOFYKyMG8CE0_wP_Z64wAk&ip=45.229.112.128&id=0b6a9101dc05d315&itag=18&source=blogger&mh=Dn&mm=31&mn=sn-qhjuxaxjvhcg-2o1e&ms=au&mv=m&mvi=2&pl=24&susc=bl&mime=video/mp4&vprv=1&dur=1446.765&lmt=1365293114432868&mt=1619329476&sparams=expire,ei,ip,id,itag,source,susc,mime,vprv,dur,lmt&sig=AOq0QJ8wRQIhAM9AK0h1EsZnFYd85LTyZkumWK0I5YLPhDQrOo0filUZAiAjfO_RJxxfyJppgfiHVOAgY1lMbzq8mqH1jmdUzibsCA%3D%3D&lsparams=mh,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhAI66NwtuaF-vAK_Ul0e4iQAZ0aNsfCxhJZ-jH0rG1MXFAiA9fF0j1VH7r5jDFGpoX5qe046BQ5yoVgC5D7tAELZPSQ%3D%3D&cpn=NLQEHPnJJPZ-ZLqo&c=WEB_EMBEDDED_PLAYER&cver=1.20210421.1.0.mp4');

    await Future.wait([_videoPlayerController.initialize()]);
    _videoPlayerController.seekTo(Duration(minutes: 5));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text('Loading'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
