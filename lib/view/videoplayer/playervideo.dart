// ignore_for_file: unused_import, avoid_unnecessary_containers, unnecessary_string_interpolations, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:videoplayer/controller/auth/authemail_password.dart';
import 'package:videoplayer/view/core.dart';
import 'package:videoplayer/view/hiddem_drawer/drawer.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late List<VideoPlayerController> _controllers;
  late List<ChewieController> _chewieControllers;
  int _currentVideoIndex = 0;
  bool _isInitializing = true;
  final cntrol = Get.put(AuthLogincontroler());

  final List<String> _videoUrls = [
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
  ];
  final downloadlink =
      "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4";
  double? _progerss;
  @override
  void initState() {
    super.initState();
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
    _initializeControllers().then((_) {
      setState(() {
        _isInitializing = false;
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

  Future<void> _initializeControllers() async {
    await Future.wait(
        _controllers.map((controller) => controller.initialize()));
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
          const Duration(seconds: 8);
      _controllers[_currentVideoIndex].seekTo(newPosition);
    });
  }

  void _rewind() {
    setState(() {
      final newPosition = _controllers[_currentVideoIndex].value.position -
          const Duration(seconds: 10);
      _controllers[_currentVideoIndex].seekTo(newPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    if (_isInitializing) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      drawer: const HiddenDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuery.height * .3,
              // color: Colors.amberAccent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Chewie(
                      controller: _chewieControllers[_currentVideoIndex],
                    ),
                  ),
                  Positioned(
                    bottom: mediaQuery.height * .3,
                    top: mediaQuery.height * .31,
                    child: SizedBox(
                      height: mediaQuery.height * .7,
                      // color: Colors.black26,
                      child: const Column(
                        children: [
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  hight10,
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 70,
                      width: double.infinity,
                      // color: Colors.amberAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Width20,
                          const SizedBox(
                            width: 20,
                          ),
                          const Spacer(),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      " ${cntrol.fetchUserProfileImageURL() ?? ""}")),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          Width20,
                          Width30,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                color: Colors.white10,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _rewind,
                      icon: const Icon(Icons.replay_10),
                    ),
                    IconButton(
                      onPressed: _previousVideo,
                      icon: const Icon(Icons.skip_previous),
                    ),
                    IconButton(
                      onPressed: _playPause,
                      icon: Icon(
                          _controllers[_currentVideoIndex].value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: _nextVideo,
                      icon: const Icon(Icons.skip_next),
                    ),
                    IconButton(
                      onPressed: _fastForward,
                      icon: const Icon(Icons.forward_10),
                    ),
                  ],
                ),
              ),
            ),
            hight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black38)),
                    onPressed: _previousVideo,
                    icon: const Icon(Icons.chevron_left_outlined)),
                SizedBox(
                  width: mediaQuery.width * .3,
                  child: _progerss != null
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                          onPressed: () {
                            FileDownloader.downloadFile(
                              url: _videoUrls[_currentVideoIndex],
                              onProgress: (fileName, progress) {
                                setState(() {
                                  _progerss = progress;
                                });
                              },
                              onDownloadCompleted: (path) {
                                Get.snackbar("successfully", "$path");
                                setState(() {
                                  _progerss = null;
                                });
                              },
                            );
                          },
                          child: const Text("Download "),
                        ),
                ),
                IconButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black38)),
                    onPressed: _nextVideo,
                    icon: const Icon(
                      Icons.chevron_right,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
