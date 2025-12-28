import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';

class BubbleVideo extends StatefulWidget {
  final Historymasseges message;
  const BubbleVideo({super.key, required this.message});

  @override
  State<BubbleVideo> createState() => _BubbleVideoState();
}

class _BubbleVideoState extends State<BubbleVideo> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.message.body!)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: _isInitialized
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                      ),
                      Text(
                        widget.message.senderName ?? '',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )
                ],
              )
            : const SizedBox(
                height: 100,
                width: 150,
                child: Center(child: CircularProgressIndicator()),
              ),
      ),
    );
  }
}
