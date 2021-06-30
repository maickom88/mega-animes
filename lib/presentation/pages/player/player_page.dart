import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player.dart';

class PlayerPage extends GetView<PlayerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PlayerController>(builder: (_) {
        if (controller.failure == null) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(
                          controller: controller.chewieController!,
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
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Houve um error ao tentar exibir seu anime, desculpe 😕",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    if (controller.urlVideo != null) {
                      controller.initializePlayer(controller.urlVideo!);
                    }
                  },
                  child: Text("Tentar novamente!")),
            ],
          ),
        );
      }),
    );
  }
}
