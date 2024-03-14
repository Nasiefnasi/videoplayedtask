
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late List<VideoPlayerController> _controllers;
  late List<ChewieController> _chewieControllers;
  int _currentVideoIndex = 0;

  final List<String> _videoUrls = [
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _controllers =
          _videoUrls.map((url) => VideoPlayerController.network(url)).toList();
      _chewieControllers = _controllers
          .map((controller) => ChewieController(
                videoPlayerController: controller,
                autoPlay: false,
                looping: false,
                allowPlaybackSpeedChanging: true,
                allowFullScreen: true,
                allowedScreenSleep: false,
              ))
          .toList();
      _controllers[0].initialize().then((_) {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var chewieController in _chewieControllers) {
      chewieController.dispose();
    }
    super.dispose();
  }

  void _playPause() {
    setState(() {
      if (_controllers[_currentVideoIndex].value.isPlaying) {
        _controllers[_currentVideoIndex].pause();
      } else {
        _controllers[_currentVideoIndex].play();
      }
    });
  }

  void _nextVideo() {
    setState(() {
      if (_currentVideoIndex < _videoUrls.length - 1) {
        _currentVideoIndex++;
      } else {
        _currentVideoIndex = 0; // Go back to the first video
      }
      _controllers[_currentVideoIndex].seekTo(Duration.zero);
      _controllers[_currentVideoIndex].play();
    });
  }

  void _previousVideo() {
    setState(() {
      if (_currentVideoIndex > 0) {
        _currentVideoIndex--;
      } else {
        _currentVideoIndex = _videoUrls.length - 1; // Go to the last video
      }
      _controllers[_currentVideoIndex].seekTo(Duration.zero);
      _controllers[_currentVideoIndex].play();
    });
  }

  void _fastForward() {
    setState(() {
      final newPosition = _controllers[_currentVideoIndex].value.position +
          Duration(seconds: 10);
      _controllers[_currentVideoIndex].seekTo(newPosition);
    });
  }

  void _rewind() {
    setState(() {
      final newPosition = _controllers[_currentVideoIndex].value.position -
          Duration(seconds: 10);
      _controllers[_currentVideoIndex].seekTo(newPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediquery = MediaQuery.of(context).size;
    if (!_controllers[_currentVideoIndex].value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: SafeArea(
        child: Container(
          height: mediquery.height * .4,
          color: Colors.amberAccent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Chewie(
                  controller: _chewieControllers[_currentVideoIndex],
                ),
              ),
              Positioned(
                bottom: mediquery.height * .03,
                top: mediquery.height * .317,
                child: Container(
                  height: mediquery.height * .5,
                  // color: Colors.black26,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 40,
                        // color: Colors.indigoAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _rewind,
                              icon: Icon(Icons.replay_10),
                            ),
                            IconButton(
                              onPressed: _previousVideo,
                              icon: Icon(Icons.skip_previous),
                            ),
                            IconButton(
                              onPressed: _playPause,
                              icon: Icon(_controllers[_currentVideoIndex]
                                      .value
                                      .isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow),
                            ),
                            IconButton(
                              onPressed: _nextVideo,
                              icon: Icon(Icons.skip_next),
                            ),
                            IconButton(
                              onPressed: _fastForward,
                              icon: Icon(Icons.forward_10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
