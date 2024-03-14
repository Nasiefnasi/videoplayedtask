// // // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // // import 'package:video_player/video_player.dart';

// // // // // // // // // // // // // // // // class GoogleDriveVideoPlayerPage extends StatefulWidget {
// // // // // // // // // // // // // // // //   final String videoUrl;

// // // // // // // // // // // // // // // //   GoogleDriveVideoPlayerPage({required this.videoUrl});

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   _GoogleDriveVideoPlayerPageState createState() =>
// // // // // // // // // // // // // // // //       _GoogleDriveVideoPlayerPageState();
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // class _GoogleDriveVideoPlayerPageState
// // // // // // // // // // // // // // // //     extends State<GoogleDriveVideoPlayerPage> {
// // // // // // // // // // // // // // // //   late VideoPlayerController _controller;
// // // // // // // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // // // // //     _controller = VideoPlayerController.network(widget.videoUrl);
// // // // // // // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // // // // // // //     _controller.setLooping(true);
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // // // // //         title: Text('Google Drive Video Player'),
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //       body: FutureBuilder(
// // // // // // // // // // // // // // // //         future: _initializeVideoPlayerFuture,
// // // // // // // // // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // // // // // // // // //           if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // // // // // //             return AspectRatio(
// // // // // // // // // // // // // // // //               aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // // // // // // //               child: VideoPlayer(_controller),
// // // // // // // // // // // // // // // //             );
// // // // // // // // // // // // // // // //           } else {
// // // // // // // // // // // // // // // //             return Center(child: CircularProgressIndicator());
// // // // // // // // // // // // // // // //           }
// // // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //       floatingActionButton: FloatingActionButton(
// // // // // // // // // // // // // // // //         onPressed: () {
// // // // // // // // // // // // // // // //           setState(() {
// // // // // // // // // // // // // // // //             if (_controller.value.isPlaying) {
// // // // // // // // // // // // // // // //               _controller.pause();
// // // // // // // // // // // // // // // //             } else {
// // // // // // // // // // // // // // // //               _controller.play();
// // // // // // // // // // // // // // // //             }
// // // // // // // // // // // // // // // //           });
// // // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // // //         child: Icon(
// // // // // // // // // // // // // // // //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// // // // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // // import 'package:video_player/video_player.dart';

// // // // // // // // // // // // // // // // void main() {
// // // // // // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // // // // // //     home: NetworkVideoPlayerPage(
// // // // // // // // // // // // // // // //       videoUrl: 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //   ));
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // class NetworkVideoPlayerPage extends StatefulWidget {
// // // // // // // // // // // // // // // //   final String videoUrl;

// // // // // // // // // // // // // // // //   NetworkVideoPlayerPage({required this.videoUrl});

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   _NetworkVideoPlayerPageState createState() => _NetworkVideoPlayerPageState();
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // class _NetworkVideoPlayerPageState extends State<NetworkVideoPlayerPage> {
// // // // // // // // // // // // // // // //   late VideoPlayerController _controller;
// // // // // // // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // // // // //     _controller = VideoPlayerController.network(widget.videoUrl);
// // // // // // // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // // // // // // //     _controller.setLooping(true);
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // // // // //         title: Text('Network Video Player'),
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //       body: FutureBuilder(
// // // // // // // // // // // // // // // //         future: _initializeVideoPlayerFuture,
// // // // // // // // // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // // // // // // // // //           if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // // // // // //             return AspectRatio(
// // // // // // // // // // // // // // // //               aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // // // // // // //               child: VideoPlayer(_controller),
// // // // // // // // // // // // // // // //             );
// // // // // // // // // // // // // // // //           } else {
// // // // // // // // // // // // // // // //             return Center(child: CircularProgressIndicator());
// // // // // // // // // // // // // // // //           }
// // // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //       floatingActionButton: FloatingActionButton(
// // // // // // // // // // // // // // // //         onPressed: () {
// // // // // // // // // // // // // // // //           setState(() {
// // // // // // // // // // // // // // // //             if (_controller.value.isPlaying) {
// // // // // // // // // // // // // // // //               _controller.pause();
// // // // // // // // // // // // // // // //             } else {
// // // // // // // // // // // // // // // //               _controller.play();
// // // // // // // // // // // // // // // //             }
// // // // // // // // // // // // // // // //           });
// // // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // // //         child: Icon(
// // // // // // // // // // // // // // // //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// // // // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // }
// // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // import 'package:video_player/video_player.dart';

// // // // // // // // // // // // // // // // void main() {
// // // // // // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // // // // // //     home: S3VideoPlayerPage(
// // // // // // // // // // // // // // // //       videoUrl: 'YOUR_S3_VIDEO_URL',
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //   ));
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // // // // // // // //   final String videoUrl;

// // // // // // // // // // // // // // //   S3VideoPlayerPage({required this.videoUrl});

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // // // // // // // //   late VideoPlayerController _controller;
// // // // // // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // // // //     _controller = VideoPlayerController.network(widget.videoUrl);
// // // // // // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // // // // // //     _controller.setLooping(true);
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // //       body: FutureBuilder(
// // // // // // // // // // // // // // //         future: _initializeVideoPlayerFuture,
// // // // // // // // // // // // // // //         builder: (context, snapshot) {
// // // // // // // // // // // // // // //           if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // // // // //             return AspectRatio(
// // // // // // // // // // // // // // //               aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // // // // // //               child: VideoPlayer(_controller),
// // // // // // // // // // // // // // //             );
// // // // // // // // // // // // // // //           } else {
// // // // // // // // // // // // // // //             return Center(child: CircularProgressIndicator());
// // // // // // // // // // // // // // //           }
// // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // //       floatingActionButton: FloatingActionButton(
// // // // // // // // // // // // // // //         onPressed: () {
// // // // // // // // // // // // // // //           setState(() {
// // // // // // // // // // // // // // //             if (_controller.value.isPlaying) {
// // // // // // // // // // // // // // //               _controller.pause();
// // // // // // // // // // // // // // //             } else {
// // // // // // // // // // // // // // //               _controller.play();
// // // // // // // // // // // // // // //             }
// // // // // // // // // // // // // // //           });
// // // // // // // // // // // // // // //         },
// // // // // // // // // // // // // // //         child: Icon(
// // // // // // // // // // // // // // //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// // // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // }
// // // // // // // // // // // // // // import 'dart:io';
// // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // import 'package:video_player/video_player.dart';
// // // // // // // // // // // // // // import 'package:path_provider/path_provider.dart';
// // // // // // // // // // // // // // import 'package:http/http.dart' as http;

// // // // // // // // // // // // // // // void main() {
// // // // // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // // // // //     home: VideoDownloadAndPlayPage(),
// // // // // // // // // // // // // // //   ));
// // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // class VideoDownloadAndPlayPage extends StatefulWidget {
// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   _VideoDownloadAndPlayPageState createState() => _VideoDownloadAndPlayPageState();
// // // // // // // // // // // // // // }

// // // // // // // // // // // // // // class _VideoDownloadAndPlayPageState extends State<VideoDownloadAndPlayPage> {
// // // // // // // // // // // // // //   VideoPlayerController? _controller;
// // // // // // // // // // // // // //   Future<void>? _initializeVideoPlayerFuture;
// // // // // // // // // // // // // //   List<String> _videoLinks = [
// // // // // // // // // // // // // //     'https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4',
// // // // // // // // // // // // // //     'https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4',
// // // // // // // // // // // // // //     'https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4',
// // // // // // // // // // // // // //   ];

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // //     _controller!.dispose();
// // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   Future<String> _downloadVideo(String videoUrl) async {
// // // // // // // // // // // // // //     final directory = await getApplicationDocumentsDirectory();
// // // // // // // // // // // // // //     final filePath = '${directory.path}/video.mp4';

// // // // // // // // // // // // // //     // Download video from URL
// // // // // // // // // // // // // //     var response = await http.get(Uri.parse(videoUrl));
// // // // // // // // // // // // // //     var file = File(filePath);
// // // // // // // // // // // // // //     await file.writeAsBytes(response.bodyBytes);

// // // // // // // // // // // // // //     return filePath;
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   Future<void> _pickAndDownloadVideo(int index) async {
// // // // // // // // // // // // // //     String? videoUrl = await _downloadVideo(_videoLinks[index]);
// // // // // // // // // // // // // //     if (videoUrl != null) {
// // // // // // // // // // // // // //       _controller = VideoPlayerController.file(File(videoUrl));
// // // // // // // // // // // // // //       _initializeVideoPlayerFuture = _controller!.initialize();
// // // // // // // // // // // // // //       setState(() {});
// // // // // // // // // // // // // //     } else {
// // // // // // // // // // // // // //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // // // // // // // // // // // // //         content: Text('Error downloading video'),
// // // // // // // // // // // // // //       ));
// // // // // // // // // // // // // //     }
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // // //         title: Text('Download and Play Video'),
// // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // //       body: Column(
// // // // // // // // // // // // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // // // // // // // // // // // //         children: [
// // // // // // // // // // // // // //           for (int i = 0; i < _videoLinks.length; i++)
// // // // // // // // // // // // // //             Padding(
// // // // // // // // // // // // // //               padding: EdgeInsets.all(8.0),
// // // // // // // // // // // // // //               child: ElevatedButton(
// // // // // // // // // // // // // //                 onPressed: () => _pickAndDownloadVideo(i),
// // // // // // // // // // // // // //                 child: Text('Video ${i + 1}'),
// // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // //           if (_controller != null)
// // // // // // // // // // // // // //             FutureBuilder(
// // // // // // // // // // // // // //               future: _initializeVideoPlayerFuture,
// // // // // // // // // // // // // //               builder: (context, snapshot) {
// // // // // // // // // // // // // //                 if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // // // //                   return AspectRatio(
// // // // // // // // // // // // // //                     aspectRatio: _controller!.value.aspectRatio,
// // // // // // // // // // // // // //                     child: VideoPlayer(_controller!),
// // // // // // // // // // // // // //                   );
// // // // // // // // // // // // // //                 } else {
// // // // // // // // // // // // // //                   return CircularProgressIndicator();
// // // // // // // // // // // // // //                 }
// // // // // // // // // // // // // //               },
// // // // // // // // // // // // // //             )
// // // // // // // // // // // // // //           else
// // // // // // // // // // // // // //             Text('No video selected'),
// // // // // // // // // // // // // //         ],
// // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // //     );
// // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // }
// // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // import 'package:video_player/video_player.dart';

// // // // // // // // // // // // // // void main() {
// // // // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // // // // // // // //   ));
// // // // // // // // // // // // // // }

// // // // // // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // // // // // //   late VideoPlayerController _controller;
// // // // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // // // // // // //   final List<String> _videoUrls = [
// // // // // // // // // // // // //     // Add your S3 video URLs here
// // // // // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // // // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // // // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // // // // // // // // // // //   ];

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // //     _controller = VideoPlayerController.network(_videoUrls[_currentVideoIndex]);
// // // // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // // // //     _controller.setLooping(true);
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   void _playPauseVideo() {
// // // // // // // // // // // // //     if (_controller.value.isPlaying) {
// // // // // // // // // // // // //       _controller.pause();
// // // // // // // // // // // // //     } else {
// // // // // // // // // // // // //       _controller.play();
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   void _skip(bool forward) {
// // // // // // // // // // // // //     if (forward) {
// // // // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // // // // // // //     } else {
// // // // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       body: Center(
// // // // // // // // // // // // //         child: FutureBuilder(
// // // // // // // // // // // // //           future: _initializeVideoPlayerFuture,
// // // // // // // // // // // // //           builder: (context, snapshot) {
// // // // // // // // // // // // //             if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // // //               return AspectRatio(
// // // // // // // // // // // // //                 aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // // // //                 child: VideoPlayer(_controller),
// // // // // // // // // // // // //               );
// // // // // // // // // // // // //             } else {
// // // // // // // // // // // // //               return CircularProgressIndicator();
// // // // // // // // // // // // //             }
// // // // // // // // // // // // //           },
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       floatingActionButton: Row(
// // // // // // // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // // // // // //         children: [
// // // // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // // // //             onPressed: _playPauseVideo,
// // // // // // // // // // // // //             tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
// // // // // // // // // // // // //             child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // // // //             onPressed: () => _skip(false),
// // // // // // // // // // // // //             tooltip: 'Backward',
// // // // // // // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // // // //             onPressed: () => _skip(true),
// // // // // // // // // // // // //             tooltip: 'Forward',
// // // // // // // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //         ],
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }
// // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // import 'package:video_viewer/video_viewer.dart';

// // // // // // // // // // // // void main() {
// // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // // // // // //   ));
// // // // // // // // // // // // }

// // // // // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // // // // //   @override
// // // // // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // // // // //   late VideoViewerController _controller;
// // // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // // // // // //   final List<String> _videoUrls = [
// // // // // // // // // // // //     // Add your S3 video URLs here
// // // // // // // // // // // //     'YOUR_S3_VIDEO_URL_1',
// // // // // // // // // // // //     'YOUR_S3_VIDEO_URL_2',
// // // // // // // // // // // //     'YOUR_S3_VIDEO_URL_3',
// // // // // // // // // // // //   ];

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     _controller = VideoViewerController.network(_videoUrls[_currentVideoIndex]);
// // // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // // //     _controller.play();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }

// // // // // // // // // // // //   void _skip(bool forward) {
// // // // // // // // // // // //     if (forward) {
// // // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // // // // // //     } else {
// // // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       body: Center(
// // // // // // // // // // // //         child: FutureBuilder(
// // // // // // // // // // // //           future: _initializeVideoPlayerFuture,
// // // // // // // // // // // //           builder: (context, snapshot) {
// // // // // // // // // // // //             if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // // //               return AspectRatio(
// // // // // // // // // // // //                 aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // // //                 child: VideoViewer(_controller),
// // // // // // // // // // // //               );
// // // // // // // // // // // //             } else {
// // // // // // // // // // // //               return CircularProgressIndicator();
// // // // // // // // // // // //             }
// // // // // // // // // // // //           },
// // // // // // // // // // // //         ),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       floatingActionButton: Row(
// // // // // // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // // // // //         children: [
// // // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // // //             onPressed: () => _skip(false),
// // // // // // // // // // // //             tooltip: 'Backward',
// // // // // // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // // //             onPressed: () => _skip(true),
// // // // // // // // // // // //             tooltip: 'Forward',
// // // // // // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }
// // // // // // // // // // // // }
// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'package:appinio_video_player/appinio_video_player.dart';
// // // // // // // // // // // import 'package:appinio_video_player/appinio_video_player.dart';

// // // // // // // // // // // // void main() {
// // // // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // // // // // //   ));
// // // // // // // // // // // // }

// // // // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // // // //   @override
// // // // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // // // }

// // // // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // // // //   late AppinioVideoPlayerController _controller;
// // // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // // // // //   final List<String> _videoUrls = [
// // // // // // // // // // //     // Add your S3 video URLs here
// // // // // // // // // // //     'YOUR_S3_VIDEO_URL_1',
// // // // // // // // // // //     'YOUR_S3_VIDEO_URL_2',
// // // // // // // // // // //     'YOUR_S3_VIDEO_URL_3',
// // // // // // // // // // //   ];

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     _controller = AppinioVideoPlayerController.network(_videoUrls[_currentVideoIndex]);
// // // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // // //     _controller.play();
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _controller.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }

// // // // // // // // // // //   void _skip(bool forward) {
// // // // // // // // // // //     if (forward) {
// // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // // // // //     } else {
// // // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     return Scaffold(
// // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // // // //       ),
// // // // // // // // // // //       body: Center(
// // // // // // // // // // //         child: FutureBuilder(
// // // // // // // // // // //           future: _initializeVideoPlayerFuture,
// // // // // // // // // // //           builder: (context, snapshot) {
// // // // // // // // // // //             if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // // //               return AspectRatio(
// // // // // // // // // // //                 aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // // //                 child: AppinioVideoPlayer(_controller),
// // // // // // // // // // //               );
// // // // // // // // // // //             } else {
// // // // // // // // // // //               return CircularProgressIndicator();
// // // // // // // // // // //             }
// // // // // // // // // // //           },
// // // // // // // // // // //         ),
// // // // // // // // // // //       ),
// // // // // // // // // // //       floatingActionButton: Row(
// // // // // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // // // //         children: [
// // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // //             onPressed: () => _skip(false),
// // // // // // // // // // //             tooltip: 'Backward',
// // // // // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // // // // //           ),
// // // // // // // // // // //           FloatingActionButton(
// // // // // // // // // // //             onPressed: () => _skip(true),
// // // // // // // // // // //             tooltip: 'Forward',
// // // // // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // // // // //           ),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }
// // // // // // // // // // // }
// // // // // // // // // // import 'dart:async';
// // // // // // // // // // import 'dart:io';
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // import 'package:http/http.dart' as http;
// // // // // // // // // // import 'package:path_provider/path_provider.dart';
// // // // // // // // // // import 'package:appinio_video_player/appinio_video_player.dart';

// // // // // // // // // // void main() {
// // // // // // // // // //   runApp(MaterialApp(
// // // // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // // // //   ));
// // // // // // // // // // }

// // // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // // //   @override
// // // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // // }

// // // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // // //   late AppinioVideoPlayerController _controller;
// // // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // // // //   final List<String> _videoUrls = [
// // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // // // // // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // // // // // // // //     // Add your S3 video URLs here

// // // // // // // // // //   ];

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     _initializeVideoPlayer(_videoUrls[_currentVideoIndex]);
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _controller.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> _initializeVideoPlayer(String videoUrl) async {
// // // // // // // // // //     final file = await _downloadVideo(videoUrl);
// // // // // // // // // //     _controller = AppinioVideoPlayerController.file(file);
// // // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // // //     _controller.play();
// // // // // // // // // //     setState(() {});
// // // // // // // // // //   }

// // // // // // // // // //   Future<File> _downloadVideo(String videoUrl) async {
// // // // // // // // // //     final directory = await getApplicationDocumentsDirectory();
// // // // // // // // // //     final filePath = '${directory.path}/video$_currentVideoIndex.mp4';

// // // // // // // // // //     final response = await http.get(Uri.parse(videoUrl));
// // // // // // // // // //     final file = File(filePath);
// // // // // // // // // //     await file.writeAsBytes(response.bodyBytes);

// // // // // // // // // //     return file;
// // // // // // // // // //   }

// // // // // // // // // //   void _skip(bool forward) {
// // // // // // // // // //     if (forward) {
// // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // // // //     } else {
// // // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Scaffold(
// // // // // // // // // //       appBar: AppBar(
// // // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // // //       ),
// // // // // // // // // //       body: Center(
// // // // // // // // // //         child: _controller != null
// // // // // // // // // //             ? FutureBuilder(
// // // // // // // // // //                 future: _initializeVideoPlayerFuture,
// // // // // // // // // //                 builder: (context, snapshot) {
// // // // // // // // // //                   if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // // //                     return AspectRatio(
// // // // // // // // // //                       aspectRatio: _controller.value.aspectRatio,
// // // // // // // // // //                       child: AppinioVideoPlayer(_controller),
// // // // // // // // // //                     );
// // // // // // // // // //                   } else {
// // // // // // // // // //                     return CircularProgressIndicator();
// // // // // // // // // //                   }
// // // // // // // // // //                 },
// // // // // // // // // //               )
// // // // // // // // // //             : Text('No video selected'),
// // // // // // // // // //       ),
// // // // // // // // // //       floatingActionButton: Row(
// // // // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // // //         children: [
// // // // // // // // // //           FloatingActionButton(
// // // // // // // // // //             onPressed: () => _skip(false),
// // // // // // // // // //             tooltip: 'Backward',
// // // // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // // // //           ),
// // // // // // // // // //           FloatingActionButton(
// // // // // // // // // //             onPressed: () => _skip(true),
// // // // // // // // // //             tooltip: 'Forward',
// // // // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }
// // // // // // // // // import 'dart:async';
// // // // // // // // // import 'dart:io';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:http/http.dart' as http;
// // // // // // // // // import 'package:path_provider/path_provider.dart';
// // // // // // // // // import 'package:appinio_video_player/appinio_video_player.dart';

// // // // // // // // // void main() {
// // // // // // // // //   runApp(MaterialApp(
// // // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // // //   ));
// // // // // // // // // }

// // // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // // //   @override
// // // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // // }

// // // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // // //   late AppinioVideoPlayerController _controller;
// // // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // // //   final List<String> _videoUrls = [
// // // // // // // // //     // Add your S3 video URLs here
// // // // // // // // //     'YOUR_S3_VIDEO_URL_1',
// // // // // // // // //     'YOUR_S3_VIDEO_URL_2',
// // // // // // // // //     'YOUR_S3_VIDEO_URL_3',
// // // // // // // // //   ];

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     _initializeVideoPlayer(_videoUrls[_currentVideoIndex]);
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _controller.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }

// // // // // // // // //   Future<void> _initializeVideoPlayer(String videoUrl) async {
// // // // // // // // //     final file = await _downloadVideo(videoUrl);
// // // // // // // // //     _controller = AppinioVideoPlayerController.file(file);
// // // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // // //     _controller.play();
// // // // // // // // //     setState(() {});
// // // // // // // // //   }

// // // // // // // // //   Future<File> _downloadVideo(String videoUrl) async {
// // // // // // // // //     final directory = await getApplicationDocumentsDirectory();
// // // // // // // // //     final filePath = '${directory.path}/video$_currentVideoIndex.mp4';

// // // // // // // // //     final response = await http.get(Uri.parse(videoUrl));
// // // // // // // // //     final file = File(filePath);
// // // // // // // // //     await file.writeAsBytes(response.bodyBytes);

// // // // // // // // //     return file;
// // // // // // // // //   }

// // // // // // // // //   void _skip(bool forward) {
// // // // // // // // //     if (forward) {
// // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // // //     } else {
// // // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Scaffold(
// // // // // // // // //       appBar: AppBar(
// // // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // // //       ),
// // // // // // // // //       body: Center(
// // // // // // // // //         child: _controller != null
// // // // // // // // //             ? FutureBuilder(
// // // // // // // // //                 future: _initializeVideoPlayerFuture,
// // // // // // // // //                 builder: (context, snapshot) {
// // // // // // // // //                   if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // // //                     return AspectRatio(
// // // // // // // // //                       aspectRatio: _controller.value.aspectRatio,
// // // // // // // // //                       child: AppinioVideoPlayer(_controller),
// // // // // // // // //                     );
// // // // // // // // //                   } else {
// // // // // // // // //                     return CircularProgressIndicator();
// // // // // // // // //                   }
// // // // // // // // //                 },
// // // // // // // // //               )
// // // // // // // // //             : Text('No video selected'),
// // // // // // // // //       ),
// // // // // // // // //       floatingActionButton: Row(
// // // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // // //         children: [
// // // // // // // // //           FloatingActionButton(
// // // // // // // // //             onPressed: () => _skip(false),
// // // // // // // // //             tooltip: 'Backward',
// // // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // // //           ),
// // // // // // // // //           FloatingActionButton(
// // // // // // // // //             onPressed: () => _skip(true),
// // // // // // // // //             tooltip: 'Forward',
// // // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }
// // // // // // // // import 'dart:async';
// // // // // // // // import 'dart:io';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:http/http.dart' as http;
// // // // // // // // import 'package:path_provider/path_provider.dart';
// // // // // // // // import 'package:appinio_video_player/appinio_video_player.dart';

// // // // // // // // void main() {
// // // // // // // //   runApp(MaterialApp(
// // // // // // // //     home: S3VideoPlayerPage(),
// // // // // // // //   ));
// // // // // // // // }

// // // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // // //   @override
// // // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // // }

// // // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // // //   late AppinioVideoPlayerController _controller;
// // // // // // // //   late Future<void> _initializeVideoPlayerFuture;
// // // // // // // //   int _currentVideoIndex = 0;
// // // // // // // //   final List<String> _videoUrls = [
// // // // // // // //     // Add your S3 video URLs here
// // // // // // // //     'YOUR_S3_VIDEO_URL_1',
// // // // // // // //     'YOUR_S3_VIDEO_URL_2',
// // // // // // // //     'YOUR_S3_VIDEO_URL_3',
// // // // // // // //   ];

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     _initializeVideoPlayer(_videoUrls[_currentVideoIndex]);
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _controller.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }

// // // // // // // //   Future<void> _initializeVideoPlayer(String videoUrl) async {
// // // // // // // //     final file = await _downloadVideo(videoUrl);
// // // // // // // //     _controller = AppinioVideoPlayerController.file(file);
// // // // // // // //     _initializeVideoPlayerFuture = _controller.initialize();
// // // // // // // //     _controller.play();
// // // // // // // //     setState(() {});
// // // // // // // //   }

// // // // // // // //   Future<File> _downloadVideo(String videoUrl) async {
// // // // // // // //     final directory = await getApplicationDocumentsDirectory();
// // // // // // // //     final filePath = '${directory.path}/video$_currentVideoIndex.mp4';

// // // // // // // //     final response = await http.get(Uri.parse(videoUrl));
// // // // // // // //     final file = File(filePath);
// // // // // // // //     await file.writeAsBytes(response.bodyBytes);

// // // // // // // //     return file;
// // // // // // // //   }

// // // // // // // //   void _skip(bool forward) {
// // // // // // // //     if (forward) {
// // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds + 10));
// // // // // // // //     } else {
// // // // // // // //       _controller.seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Scaffold(
// // // // // // // //       appBar: AppBar(
// // // // // // // //         title: Text('S3 Video Player'),
// // // // // // // //       ),
// // // // // // // //       body: Center(
// // // // // // // //         child: _controller != null
// // // // // // // //             ? FutureBuilder(
// // // // // // // //                 future: _initializeVideoPlayerFuture,
// // // // // // // //                 builder: (context, snapshot) {
// // // // // // // //                   if (snapshot.connectionState == ConnectionState.done) {
// // // // // // // //                     return AspectRatio(
// // // // // // // //                       aspectRatio: _controller.value.aspectRatio,
// // // // // // // //                       child: AppinioVideoPlayer(_controller),
// // // // // // // //                     );
// // // // // // // //                   } else {
// // // // // // // //                     return CircularProgressIndicator();
// // // // // // // //                   }
// // // // // // // //                 },
// // // // // // // //               )
// // // // // // // //             : Text('No video selected'),
// // // // // // // //       ),
// // // // // // // //       floatingActionButton: Row(
// // // // // // // //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // // //         children: [
// // // // // // // //           FloatingActionButton(
// // // // // // // //             onPressed: () => _skip(false),
// // // // // // // //             tooltip: 'Backward',
// // // // // // // //             child: Icon(Icons.replay_10),
// // // // // // // //           ),
// // // // // // // //           FloatingActionButton(
// // // // // // // //             onPressed: () => _skip(true),
// // // // // // // //             tooltip: 'Forward',
// // // // // // // //             child: Icon(Icons.forward_10),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }
// // // // // // // import 'dart:async';
// // // // // // // import 'dart:io';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:http/http.dart' as http;
// // // // // // // import 'package:path_provider/path_provider.dart';
// // // // // // // import 'package:flick_video_player/flick_video_player.dart';
// // // // // // // import 'package:video_player/video_player.dart';

// // // // // // // void main() {
// // // // // // //   runApp(MaterialApp(
// // // // // // //     home: S3VideoPlayerPage(),
// // // // // // //   ));
// // // // // // // }

// // // // // // // class S3VideoPlayerPage extends StatefulWidget {
// // // // // // //   @override
// // // // // // //   _S3VideoPlayerPageState createState() => _S3VideoPlayerPageState();
// // // // // // // }

// // // // // // // class _S3VideoPlayerPageState extends State<S3VideoPlayerPage> {
// // // // // // //   late FlickManager _flickManager;
// // // // // // //   int _currentVideoIndex = 0;
// // // // // // //   final List<String> _videoUrls = [
// // // // // // //     // Add your S3 video URLs here
// // // // // // //     'YOUR_S3_VIDEO_URL_1',
// // // // // // //     'YOUR_S3_VIDEO_URL_2',
// // // // // // //     'YOUR_S3_VIDEO_URL_3',
// // // // // // //   ];

// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     _flickManager = FlickManager(
// // // // // // //       videoPlayerController: VideoPlayerController.network(_videoUrls[_currentVideoIndex]),
// // // // // // //     );
// // // // // // //     _flickManager.flickControlManager.autoPause();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _flickManager.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }

// // // // // // //   Future<File> _downloadVideo(String videoUrl) async {
// // // // // // //     final directory = await getApplicationDocumentsDirectory();
// // // // // // //     final filePath = '${directory.path}/video$_currentVideoIndex.mp4';

// // // // // // //     final response = await http.get(Uri.parse(videoUrl));
// // // // // // //     final file = File(filePath);
// // // // // // //     await file.writeAsBytes(response.bodyBytes);

// // // // // // //     return file;
// // // // // // //   }

// // // // // // //   void _skip(bool forward) {
// // // // // // //     if (forward) {
// // // // // // //       _flickManager.seekForward(Duration(seconds: 10));
// // // // // // //     } else {
// // // // // // //       _flickManager.seekBack(Duration(seconds: 10));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> _changeVideo(String videoUrl) async {
// // // // // // //     final file = await _downloadVideo(videoUrl);
// // // // // // //     _flickManager.dispose();
// // // // // // //     setState(() {
// // // // // // //       _flickManager = FlickManager(
// // // // // // //         videoPlayerController: VideoPlayerController.file(file),
// // // // // // //       );
// // // // // // //       _flickManager.flickControlManager.autoPlayToggle();
// // // // // // //     });
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Scaffold(
// // // // // // //       appBar: AppBar(
// // // // // // //         title: Text('S3 Video Player'),
// // // // // // //       ),
// // // // // // //       body: Column(
// // // // // // //         children: [
// // // // // // //           Expanded(
// // // // // // //             child: FlickVideoPlayer(
// // // // // // //               flickManager: _flickManager,
// // // // // // //               flickVideoWithControls: FlickVideoWithControls(
// // // // // // //                 controls: FlickPortraitControls(),
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           Row(
// // // // // // //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // // // //             children: [
// // // // // // //               ElevatedButton(
// // // // // // //                 onPressed: () => _skip(false),
// // // // // // //                 child: Icon(Icons.replay_10),
// // // // // // //               ),
// // // // // // //               ElevatedButton(
// // // // // // //                 onPressed: () => _skip(true),
// // // // // // //                 child: Icon(Icons.forward_10),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:video_player/video_player.dart';

// // // // // // // void main() {
// // // // // // //   runApp(MaterialApp(
// // // // // // //     home: VideoPlayerPage(),
// // // // // // //   ));
// // // // // // // }

// // // // // // class VideoPlayerPage extends StatefulWidget {
// // // // // //   @override
// // // // // //   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// // // // // // }

// // // // // // class _VideoPlayerPageState extends State<VideoPlayerPage> {
// // // // // //   late VideoPlayerController _controller;
// // // // // //   final String _videoUrl = 'YOUR_VIDEO_URL';

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     _controller = VideoPlayerController.network(_videoUrl)
// // // // // //       ..initialize().then((_) {
// // // // // //         setState(() {});
// // // // // //       });
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _controller.dispose();
// // // // // //     super.dispose();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('Video Player'),
// // // // // //       ),
// // // // // //       body: Center(
// // // // // //         child: _controller.value.isInitialized
// // // // // //             ? AspectRatio(
// // // // // //                 aspectRatio: _controller.value.aspectRatio,
// // // // // //                 child: VideoPlayer(_controller),
// // // // // //               )
// // // // // //             : CircularProgressIndicator(),
// // // // // //       ),
// // // // // //       floatingActionButton: FloatingActionButton(
// // // // // //         onPressed: () {
// // // // // //           setState(() {
// // // // // //             if (_controller.value.isPlaying) {
// // // // // //               _controller.pause();
// // // // // //             } else {
// // // // // //               _controller.play();
// // // // // //             }
// // // // // //           });
// // // // // //         },
// // // // // //         child: Icon(
// // // // // //           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:video_player/video_player.dart';

// // // // // void main() {
// // // // //   runApp(MaterialApp(
// // // // //     home: VideoPlayerPage(),
// // // // //   ));
// // // // // }

// // // // // class VideoPlayerPage extends StatefulWidget {
// // // // //   @override
// // // // //   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// // // // // }

// // // // // class _VideoPlayerPageState extends State<VideoPlayerPage> {
// // // // //   late VideoPlayerController _controller;
// // // // //   int _currentVideoIndex = 0;
// // // // //   final List<String> _videoUrls = [
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // // //   ];

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _controller = VideoPlayerController.network(_videoUrls[_currentVideoIndex])
// // // // //       ..initialize().then((_) {
// // // // //         setState(() {});
// // // // //       });
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _controller.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   void _switchVideo() {
// // // // //     setState(() {
// // // // //       _currentVideoIndex = (_currentVideoIndex + 1) % _videoUrls.length;
// // // // //       _controller =
// // // // //           VideoPlayerController.network(_videoUrls[_currentVideoIndex])
// // // // //             ..initialize().then((_) {
// // // // //               setState(() {});
// // // // //             });
// // // // //       _controller.play();
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('Video Player'),
// // // // //       ),
// // // // //       body: Center(
// // // // //         child: _controller.value.isInitialized
// // // // //             ? AspectRatio(
// // // // //                 aspectRatio: _controller.value.aspectRatio,
// // // // //                 child: VideoPlayer(_controller),
// // // // //               )
// // // // //             : CircularProgressIndicator(),
// // // // //       ),
// // // // //       floatingActionButton: Row(
// // // // //         mainAxisAlignment: MainAxisAlignment.end,
// // // // //         children: [
// // // // //           FloatingActionButton(
// // // // //             onPressed: _switchVideo,
// // // // //             tooltip: 'Switch Video',
// // // // //             child: Icon(Icons.swap_horiz),
// // // // //           ),
// // // // //           SizedBox(width: 10),
// // // // //           FloatingActionButton(
// // // // //             onPressed: () {
// // // // //               setState(() {
// // // // //                 if (_controller.value.isPlaying) {
// // // // //                   _controller.pause();
// // // // //                 } else {
// // // // //                   _controller.play();
// // // // //                 }
// // // // //               });
// // // // //             },
// // // // //             child: Icon(
// // // // //               _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:video_player/video_player.dart';
// // // // import 'package:flick_video_player/flick_video_player.dart';

// // // // class VideoPlayerPage extends StatefulWidget {
// // // //   const VideoPlayerPage({super.key});

// // // //   @override
// // // //   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// // // // }

// // // // class _VideoPlayerPageState extends State<VideoPlayerPage> {
// // // //   late VideoPlayerController _controller;
// // // //   bool _isPlaying = false;
// // // //   bool _isFullScreen = false;
// // // //   final List<String> _videoUrls = [
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // //   ];
// // // //   int _currentVideoIndex = 0;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _controller = VideoPlayerController.network(_videoUrls[_currentVideoIndex])
// // // //       ..initialize().then((_) {
// // // //         setState(() {});
// // // //       });
// // // //     _controller.addListener(() {
// // // //       if (_controller.value.position == _controller.value.duration) {
// // // //         _controller.pause();
// // // //         _isPlaying = false;
// // // //       }
// // // //       setState(() {});
// // // //     });
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _controller.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _playPause() {
// // // //     if (_controller.value.isPlaying) {
// // // //       _controller.pause();
// // // //       _isPlaying = false;
// // // //     } else {
// // // //       _controller.play();
// // // //       _isPlaying = true;
// // // //     }
// // // //     setState(() {});
// // // //   }

// // // //   void _nextVideo() {
// // // //     if (_currentVideoIndex < _videoUrls.length - 1) {
// // // //       _currentVideoIndex++;
// // // //     } else {
// // // //       _currentVideoIndex = 0;
// // // //     }
// // // //     _controller.pause();
// // // //     _controller = VideoPlayerController.network(_videoUrls[_currentVideoIndex])
// // // //       ..initialize().then((_) {
// // // //         _controller.play();
// // // //         _isPlaying = true;
// // // //         setState(() {});
// // // //       });
// // // //   }

// // // //   void _previousVideo() {
// // // //     if (_currentVideoIndex > 0) {
// // // //       _currentVideoIndex--;
// // // //     } else {
// // // //       _currentVideoIndex = _videoUrls.length - 1;
// // // //     }
// // // //     _controller.pause();
// // // //     _controller = VideoPlayerController.network(_videoUrls[_currentVideoIndex])
// // // //       ..initialize().then((_) {
// // // //         _controller.play();
// // // //         _isPlaying = true;
// // // //         setState(() {});
// // // //       });
// // // //   }

// // // //   void _fastForward() {
// // // //     final position = _controller.value.position + Duration(seconds: 10);
// // // //     _controller.seekTo(position);
// // // //   }

// // // //   void _rewind() {
// // // //     final position = _controller.value.position - Duration(seconds: 10);
// // // //     _controller.seekTo(position);
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Video Player'),
// // // //       ),
// // // //       body: Stack(
// // // //         children: [
// // // //           Center(
// // // //             child: _controller.value.isInitialized
// // // //                 ? AspectRatio(
// // // //                     aspectRatio: _controller.value.aspectRatio,
// // // //                     child: VideoPlayer(_controller),
// // // //                   )
// // // //                 : CircularProgressIndicator(),
// // // //           ),
// // // //           Positioned(
// // // //             bottom: 0,
// // // //             left: 0,
// // // //             right: 0,
// // // //             child: Container(
// // // //               color: Colors.black.withOpacity(0.5),
// // // //               padding: EdgeInsets.all(16),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   IconButton(
// // // //                     onPressed: _rewind,
// // // //                     icon: Icon(Icons.replay_10, color: Colors.white),
// // // //                   ),
// // // //                   IconButton(
// // // //                     onPressed: _previousVideo,
// // // //                     icon: Icon(Icons.skip_previous, color: Colors.white),
// // // //                   ),
// // // //                   IconButton(
// // // //                     onPressed: _playPause,
// // // //                     icon: Icon(
// // // //                       _isPlaying ? Icons.pause : Icons.play_arrow,
// // // //                       color: Colors.white,
// // // //                     ),
// // // //                   ),
// // // //                   IconButton(
// // // //                     onPressed: _nextVideo,
// // // //                     icon: Icon(Icons.skip_next, color: Colors.white),
// // // //                   ),
// // // //                   IconButton(
// // // //                     onPressed: _fastForward,
// // // //                     icon: Icon(Icons.forward_10, color: Colors.white),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // class SamplePlayer extends StatefulWidget {
// // // // //   const SamplePlayer({super.key, }) ;

// // // // //   @override
// // // // //   _SamplePlayerState createState() => _SamplePlayerState();
// // // // // }

// // // // // class _SamplePlayerState extends State<SamplePlayer> {
// // // // //   late FlickManager flickManager;
// // // // //    final List<String> _videoUrls = [
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // // //   ];
// // // // //   int _currentVideoIndex = 0;
// // // // //   @override

// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     flickManager = FlickManager(
// // // // //       videoPlayerController:
// // // // //           VideoPlayerController.networkUrl(Uri.parse(_videoUrls[_currentVideoIndex]),
// // // // //      ) );
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     flickManager.dispose();
// // // // //     super.dispose();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Container(
// // // // //       child: FlickVideoPlayer(
// // // // //         flickManager: flickManager
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flick_video_player/flick_video_player.dart';
// // // // // import 'package:video_player/video_player.dart';

// // // // class SamplePlayer extends StatefulWidget {
// // // //   const SamplePlayer({Key? key}) : super(key: key);

// // // //   @override
// // // //   _SamplePlayerState createState() => _SamplePlayerState();
// // // // }

// // // // class _SamplePlayerState extends State<SamplePlayer> {
// // // //   late FlickManager flickManager;
// // // //   final List<String> _videoUrls = [
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // // //   ];
// // // //   int _currentVideoIndex = 0;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _initializeFlickManager();
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     flickManager.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _initializeFlickManager() {
// // // //     flickManager = FlickManager(
// // // //       videoPlayerController:
// // // //           VideoPlayerController.network(_videoUrls[_currentVideoIndex]),
// // // //     );
// // // //   }

// // // //   void _switchVideo(int newIndex) {
// // // //     setState(() {
// // // //       _currentVideoIndex = newIndex;
// // // //       flickManager.dispose();
// // // //       _initializeFlickManager();
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Column(
// // // //       children: [
// // // //         Container(
// // // //           child: AspectRatio(
// // // //             aspectRatio: 16 / 9,
// // // //             child: FlickVideoPlayer(
// // // //               flickManager: flickManager,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         Container(
// // // //           child: AspectRatio(
// // // //             aspectRatio: 16 / 9,
// // // //             child: FlickVideoPlayer(
// // // //               flickManager: flickManager,
// // // //             ),
// // // //           ),
// // // //         ),
// // // //         Row(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: List.generate(
// // // //             _videoUrls.length,
// // // //             (index) => IconButton(
// // // //               icon: Icon(Icons.video_library),
// // // //               onPressed: () => _switchVideo(index),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:video_player/video_player.dart';
// // // import 'package:chewie/chewie.dart';
// // // import 'package:flick_video_player/flick_video_player.dart';

// // // class SamplePlayer extends StatefulWidget {
// // //   const SamplePlayer({Key? key}) : super(key: key);

// // //   @override
// // //   _SamplePlayerState createState() => _SamplePlayerState();
// // // }

// // // class _SamplePlayerState extends State<SamplePlayer> {
// // //   late FlickManager flickManager;
// // //   late VideoPlayerController _videoPlayerController;
// // //   late ChewieController _chewieController;

// // //   final List<String> _videoUrls = [
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // //   ];
// // //   int _currentVideoIndex = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _initializeVideoPlayer();
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _chewieController.dispose();
// // //     flickManager.dispose();
// // //     super.dispose();
// // //   }

// // //   void _initializeVideoPlayer() {
// // //     _videoPlayerController =
// // //         VideoPlayerController.network(_videoUrls[_currentVideoIndex]);
// // //     _chewieController = ChewieController(
// // //       videoPlayerController: _videoPlayerController,
// // //       autoPlay: true,
// // //       looping: false,
// // //       // Add additional options here
// // //     );
// // //     flickManager = FlickManager(
// // //       videoPlayerController: _videoPlayerController,
// // //     );
// // //   }

// // //   void _switchVideo(int newIndex) {
// // //     setState(() {
// // //       _currentVideoIndex = newIndex;
// // //       _videoPlayerController =
// // //           VideoPlayerController.network(_videoUrls[_currentVideoIndex]);
// // //       _chewieController = ChewieController(
// // //         videoPlayerController: _videoPlayerController,
// // //         autoPlay: true,
// // //         looping: false,
// // //         // Add additional options here
// // //       );
// // //       flickManager.dispose();
// // //       flickManager = FlickManager(
// // //         videoPlayerController: _videoPlayerController,
// // //       );
// // //     });
// // //   }

// // // ignore_for_file: unused_field

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Column(
// // //       children: [
// // //         Expanded(
// // //           child: Container(
// // //             child: FlickVideoPlayer(
// // //               flickManager: flickManager,
// // //             ),
// // //           ),
// // //         ),
// // //         Row(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: List.generate(
// // //             _videoUrls.length,
// // //             (index) => IconButton(
// // //               icon: Icon(Icons.video_library),
// // //               onPressed: () => _switchVideo(index),
// // //             ),
// // //           ),
// // //         ),
// // //         Chewie(
// // //           controller: _chewieController,
// // //         ),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:appinio_video_player/appinio_video_player.dart';
// // import 'package:flutter/material.dart';
// // import 'package:chewie/chewie.dart';

// // // class VideoPlayerPage extends StatefulWidget {
// // //   @override
// // //   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// // // }

// // // class _VideoPlayerPageState extends State<VideoPlayerPage> {
// // //   late List<VideoPlayerController> _controllers;
// // //   late List<ChewieController> _chewieControllers;
// // //   int _currentVideoIndex = 0;

// // //   final List<String> _videoUrls = [
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
// // //     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _controllers =
// // //         _videoUrls.map((url) => VideoPlayerController.network(url)).toList();
// // //     _chewieControllers = _controllers
// // //         .map((controller) => ChewieController(
// // //               videoPlayerController: controller,
// // //               autoPlay: false,
// // //               looping: false,
// // //               allowPlaybackSpeedChanging: true,
// // //               allowFullScreen: true,
// // //               allowedScreenSleep: false,
// // //             ))
// // //         .toList();
// // //     _controllers[0].initialize().then((_) {
// // //       setState(() {});
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     for (var controller in _controllers) {
// // //       controller.dispose();
// // //     }
// // //     for (var chewieController in _chewieControllers) {
// // //       chewieController.dispose();
// // //     }
// // //     super.dispose();
// // //   }

// // //   void _playPause() {
// // //     if (_controllers[_currentVideoIndex].value.isPlaying) {
// // //       _controllers[_currentVideoIndex].pause();
// // //     } else {
// // //       _controllers[_currentVideoIndex].play();
// // //     }
// // //     setState(() {});
// // //   }

// // //   void _nextVideo() {
// // //     if (_currentVideoIndex < _videoUrls.length - 1) {
// // //       _currentVideoIndex++;
// // //     } else {
// // //       _currentVideoIndex = 0;
// // //     }
// // //     setState(() {});
// // //   }

// // //   void _previousVideo() {
// // //     if (_currentVideoIndex > 0) {
// // //       _currentVideoIndex--;
// // //     } else {
// // //       _currentVideoIndex = _videoUrls.length - 1;
// // //     }
// // //     setState(() {});
// // //   }

// // //   void _fastForward() {
// // //     final newPosition = _controllers[_currentVideoIndex].value.position +
// // //         const Duration(seconds: 10);
// // //     _controllers[_currentVideoIndex].seekTo(newPosition);
// // //     setState(() {});
// // //   }

// // //   void _rewind() {
// // //     final newPosition = _controllers[_currentVideoIndex].value.position -
// // //         const Duration(seconds: 10);
// // //     _controllers[_currentVideoIndex].seekTo(newPosition);
// // //     setState(() {});
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     if (!_controllers[_currentVideoIndex].value.isInitialized) {
// // //       return const Center(child: CircularProgressIndicator());
// // //     }
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Video Player'),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Chewie(
// // //             controller: _chewieControllers[_currentVideoIndex],
// // //           ),
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             children: [
// // //               IconButton(
// // //                 onPressed: _rewind,
// // //                 icon: const Icon(Icons.replay_10),
// // //               ),
// // //               IconButton(
// // //                 onPressed: _previousVideo,
// // //                 icon: const Icon(Icons.skip_previous),
// // //               ),
// // //               IconButton(
// // //                 onPressed: _playPause,
// // //                 icon: Icon(_controllers[_currentVideoIndex].value.isPlaying
// // //                     ? Icons.pause
// // //                     : Icons.play_arrow),
// // //               ),
// // //               IconButton(
// // //                 onPressed: _nextVideo,
// // //                 icon: const Icon(Icons.skip_next),
// // //               ),
// // //               IconButton(
// // //                 onPressed: _fastForward,
// // //                 icon: const Icon(Icons.forward_10),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // class VideoPlayerPages extends StatefulWidget {
// //   const VideoPlayerPages({super.key});

// //   @override
// //   State<VideoPlayerPages> createState() => _VideoPlayerPagesState();
// // }

// // class _VideoPlayerPagesState extends State<VideoPlayerPages> {
// //   late CustomVideoPlayerController _customVideoPlayerController;
// //   Uri videourl = Uri.parse(
// //       "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4");
// //   @override
// //   void initState() {
// //     _initializeVideoPlayer();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: [
// //           CustomVideoPlayer(
// //               customVideoPlayerController: _customVideoPlayerController)
// //         ],
// //       ),
// //     );
// //   }

// //   void _initializeVideoPlayer() {
// //     VideoPlayerController _videoPlayerController;
// //     _videoPlayerController = VideoPlayerController.networkUrl(videourl)
// //       ..initialize().then((value) {
// //         setState(() {});
// //       });
// //     _customVideoPlayerController = CustomVideoPlayerController(
// //         context: context, videoPlayerController: _videoPlayerController);
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideoPlayerPage extends StatefulWidget {
//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late List<VideoPlayerController> _controllers;
//   late List<ChewieController> _chewieControllers;
//   int _currentVideoIndex = 0;

//   final List<String> _videoUrls = [
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controllers = _videoUrls.map((url) => VideoPlayerController.network(url)).toList();
//     _chewieControllers = _controllers
//         .map((controller) => ChewieController(
//               videoPlayerController: controller,
//               // autoPlay: true,
//               looping: false,
//               allowPlaybackSpeedChanging: true,
//               allowFullScreen: true,
//               allowedScreenSleep: false,
//             ))
//         .toList();
//     _controllers[0].initialize().then((_) {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var chewieController in _chewieControllers) {
//       chewieController.dispose();
//     }
//     super.dispose();
//   }

//   void _playPause() {
//     if (_controllers[_currentVideoIndex].value.isPlaying) {
//       _controllers[_currentVideoIndex].pause();
//     } else {
//       _controllers[_currentVideoIndex].play();
//     }
//     setState(() {});
//   }

//   void _nextVideo() {
//     if (_currentVideoIndex < _videoUrls.length - 1) {
//       _currentVideoIndex++;
//     } else {
//       _currentVideoIndex = 0;
//     }
//     setState(() {});
//   }

//   void _previousVideo() {
//     if (_currentVideoIndex > 0) {
//       _currentVideoIndex--;
//     } else {
//       _currentVideoIndex = _videoUrls.length - 1;
//     }
//     setState(() {});
//   }

//   void _fastForward() {
//     final newPosition = _controllers[_currentVideoIndex].value.position + Duration(seconds: 10);
//     _controllers[_currentVideoIndex].seekTo(newPosition);
//     setState(() {});
//   }

//   void _rewind() {
//     final newPosition = _controllers[_currentVideoIndex].value.position - Duration(seconds: 10);
//     _controllers[_currentVideoIndex].seekTo(newPosition);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_controllers[_currentVideoIndex].value.isInitialized) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: ListView(
//         children: [
//           Chewie(
//             controller: _chewieControllers[_currentVideoIndex],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container( width: double.infinity,height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     onPressed: _rewind,
//                     icon: Icon(Icons.replay_10),
//                   ),
//                   IconButton(
//                     onPressed: _previousVideo,
//                     icon: Icon(Icons.skip_previous),
//                   ),
//                   IconButton(
//                     onPressed: _playPause,
//                     icon: Icon(
//                         _controllers[_currentVideoIndex].value.isPlaying ? Icons.pause : Icons.play_arrow),
//                   ),
//                   IconButton(
//                     onPressed: _nextVideo,
//                     icon: Icon(Icons.skip_next),
//                   ),
//                   IconButton(
//                     onPressed: _fastForward,
//                     icon: Icon(Icons.forward_10),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideoPlayerPage extends StatefulWidget {
//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late List<VideoPlayerController> _controllers;
//   late List<ChewieController> _chewieControllers;
//   int _currentVideoIndex = 0;

//   final List<String> _videoUrls = [
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _controllers =
//           _videoUrls.map((url) => VideoPlayerController.network(url)).toList();
//       _chewieControllers = _controllers
//           .map((controller) => ChewieController(
//                 videoPlayerController: controller,
//                 autoPlay: false,
//                 looping: false,
//                 allowPlaybackSpeedChanging: true,
//                 allowFullScreen: true,
//                 allowedScreenSleep: false,
//               ))
//           .toList();
//       _controllers[0].initialize().then((_) {
//         setState(() {});
//       });
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var chewieController in _chewieControllers) {
//       chewieController.dispose();
//     }
//     super.dispose();
//   }

//   void _playPause() {
//     setState(() {
//       if (_controllers[_currentVideoIndex].value.isPlaying) {
//         _controllers[_currentVideoIndex].pause();
//       } else {
//         _controllers[_currentVideoIndex].play();
//       }
//     });
//   }

//   void _nextVideo() {
//     setState(() {
//       if (_currentVideoIndex < _videoUrls.length - 1) {
//         _currentVideoIndex++;
//       } else {
//         _currentVideoIndex = 0; // Go back to the first video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
//     });
//   }

//   void _previousVideo() {
//     setState(() {
//       if (_currentVideoIndex > 0) {
//         _currentVideoIndex--;
//       } else {
//         _currentVideoIndex = _videoUrls.length - 1; // Go to the last video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
//     });
//   }

//   void _fastForward() {
//     setState(() {
//       final newPosition = _controllers[_currentVideoIndex].value.position +
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
//     });
//   }

//   void _rewind() {
//     setState(() {
//       final newPosition = _controllers[_currentVideoIndex].value.position -
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediquery=MediaQuery.of(context).size;
//     if (!_controllers[_currentVideoIndex].value.isInitialized) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: SafeArea(
//         child: Container(
//           height: mediquery.height*.4,color: Colors.amberAccent,
//           child: Stack(alignment:Alignment.center ,
//             children: [
//               Container(
//                 child: Chewie(
//                   controller: _chewieControllers[_currentVideoIndex],
//                 ),
//               ),
//               Positioned(
//                 bottom: mediquery.height*.03,top: mediquery.height*.31,
//                 child: Container(height: mediquery.height*.5,color: Colors.black26,
//                   child: Column(
//                     children: [Spacer(),
//                       Container(height: 40 ,
//                       // color: Colors.indigoAccent,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               onPressed: _rewind,
//                               icon: Icon(Icons.replay_10),
//                             ),
//                             IconButton(
//                               onPressed: _previousVideo,
//                               icon: Icon(Icons.skip_previous),
//                             ),
//                             IconButton(
//                               onPressed: _playPause,
//                               icon: Icon(_controllers[_currentVideoIndex]
//                                       .value
//                                       .isPlaying
//                                   ? Icons.pause
//                                   : Icons.play_arrow),
//                             ),
//                             IconButton(
//                               onPressed: _nextVideo,
//                               icon: Icon(Icons.skip_next),
//                             ),
//                             IconButton(
//                               onPressed: _fastForward,
//                               icon: Icon(Icons.forward_10),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideoPlayerPage extends StatefulWidget {
//   @override
//   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late List<VideoPlayerController> _controllers;
//   late List<ChewieController> _chewieControllers;
//   int _currentVideoIndex = 0;
//   bool _isInitializing = true;

//   final List<String> _videoUrls = [
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controllers = _videoUrls
//         .map((url) => VideoPlayerController.network(url))
//         .toList();
//     _chewieControllers = _controllers
//         .map((controller) => ChewieController(
//               videoPlayerController: controller,
//               autoPlay: false,
//               looping: false,
//               allowPlaybackSpeedChanging: true,
//               allowFullScreen: true,
//               allowedScreenSleep: false,
//             ))
//         .toList();
//     _initializeControllers().then((_) {
//       setState(() {
//         _isInitializing = false;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var chewieController in _chewieControllers) {
//       chewieController.dispose();
//     }
//     super.dispose();
//   }

//   Future<void> _initializeControllers() async {
//     await Future.wait(_controllers.map((controller) => controller.initialize()));
//   }

//   void _playPause() {
//     setState(() {
//       if (_controllers[_currentVideoIndex].value.isPlaying) {
//         _controllers[_currentVideoIndex].pause();
//       } else {
//         _controllers[_currentVideoIndex].play();
//       }
//     });
//   }

//   void _nextVideo() {
//     setState(() {
//       if (_currentVideoIndex < _videoUrls.length - 1) {
//         _currentVideoIndex++;
//       } else {
//         _currentVideoIndex = 0; // Go back to the first video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
//     });
//   }

//   void _previousVideo() {
//     setState(() {
//       if (_currentVideoIndex > 0) {
//         _currentVideoIndex--;
//       } else {
//         _currentVideoIndex = _videoUrls.length - 1; // Go to the last video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
//     });
//   }

//   void _fastForward() {
//     setState(() {
//       final newPosition = _controllers[_currentVideoIndex].value.position +
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
//     });
//   }

//   void _rewind() {
//     setState(() {
//       final newPosition = _controllers[_currentVideoIndex].value.position -
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context).size;
//     if (_isInitializing) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: SafeArea(
//         child: Container(
//           height: mediaQuery.height * .4,
//           color: Colors.amberAccent,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 child: Chewie(
//                   controller: _chewieControllers[_currentVideoIndex],
//                 ),
//               ),
//               Positioned(
//                 bottom: mediaQuery.height * .03,
//                 top: mediaQuery.height * .31,
//                 child: Container(
//                   height: mediaQuery.height * .5,
//                   color: Colors.black26,
//                   child: Column(
//                     children: [
//                       Spacer(),
//                       Container(
//                         height: 40,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                               onPressed: _rewind,
//                               icon: Icon(Icons.replay_10),
//                             ),
//                             IconButton(
//                               onPressed: _previousVideo,
//                               icon: Icon(Icons.skip_previous),
//                             ),
//                             IconButton(
//                               onPressed: _playPause,
//                               icon: Icon(_controllers[_currentVideoIndex]
//                                       .value
//                                       .isPlaying
//                                   ? Icons.pause
//                                   : Icons.play_arrow),
//                             ),
//                             IconButton(
//                               onPressed: _nextVideo,
//                               icon: Icon(Icons.skip_next),
//                             ),
//                             IconButton(
//                               onPressed: _fastForward,
//                               icon: Icon(Icons.forward_10),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
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
  bool _isInitializing = true;

  final List<String> _videoUrls = [
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
    "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
  ];

  @override
  void initState() {
    super.initState();
    _controllers = _videoUrls
        .map((url) => VideoPlayerController.network(url))
        .toList();
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
    await Future.wait(_controllers.map((controller) => controller.initialize()));
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
    var mediaQuery = MediaQuery.of(context).size;
    if (_isInitializing) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: SafeArea(
        child: Container(
          height: mediaQuery.height * .4,
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
                bottom: mediaQuery.height * .03,
                top: mediaQuery.height * .31,
                child: Container(
                  height: mediaQuery.height * .5,
                  color: Colors.black26,
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        height: 40,
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
