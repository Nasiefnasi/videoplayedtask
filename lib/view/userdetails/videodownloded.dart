// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';
// // import 'dart:async';
// // import 'dart:io';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:video_player/video_player.dart';

// // import 'package:http/http.dart' as http;

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   late VideoPlayerController _controller;
// //   late Future<void> _initializeVideoPlayerFuture;
// //   final List<String> _videoLinks = [
// //     // Add your Google Drive video links here
// //     "https://drive.google.com/file/d/1JHX2Z0kslFr3zcGhsfw5RupEs7ZiWPgd/view?usp=drive_link",
// //     'https://drive.google.com/file/d/1HmVkJviyH_F6qwnU2-HOWJgpsunTylol/view?usp=drive_link',
// //     'https://drive.google.com/file/d/1sqYGF1UiQJmO3xl-Ur6DJD4BFn4J2FyZ/view?usp=drive_link',
// //   ];
// //   int _currentVideoIndex = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializePlayer();
// //   }

// //   void _initializePlayer() {
// //     _controller = VideoPlayerController.network(
// //       _videoLinks[_currentVideoIndex],
// //     );
// //     _initializeVideoPlayerFuture = _controller.initialize();
// //     _controller.addListener(() {
// //       if (_controller.value.isPlaying &&
// //           _controller.value.duration == _controller.value.position) {
// //         _nextVideo();
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   void _nextVideo() {
// //     setState(() {
// //       _currentVideoIndex = (_currentVideoIndex + 1) % _videoLinks.length;
// //       _controller = VideoPlayerController.network(
// //         _videoLinks[_currentVideoIndex],
// //       );
// //       _initializeVideoPlayerFuture = _controller.initialize();
// //       _controller.play();
// //     });
// //   }

// //   Future<void> _downloadVideo() async {
// //     final response = await http.get(_videoLinks[_currentVideoIndex]);
// //     final documentDirectory = await getApplicationDocumentsDirectory();
// //     final file = File('${documentDirectory.path}/video$_currentVideoIndex.mp4');
// //     file.writeAsBytesSync(response.bodyBytes);
// //     setState(() {
// //       _controller = VideoPlayerController.file(file);
// //       _initializeVideoPlayerFuture = _controller.initialize();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Video Player Demo'),
// //       ),
// //       body: Center(
// //         child: FutureBuilder(
// //           future: _initializeVideoPlayerFuture,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.done) {
// //               return AspectRatio(
// //                 aspectRatio: _controller.value.aspectRatio,
// //                 child: VideoPlayer(_controller),
// //               );
// //             } else {
// //               return CircularProgressIndicator();
// //             }
// //           },
// //         ),
// //       ),
// //       floatingActionButton: Row(
// //         mainAxisAlignment: MainAxisAlignment.end,
// //         children: [
// //           FloatingActionButton(
// //             onPressed: _downloadVideo,
// //             tooltip: 'Download Video',
// //             child: Icon(Icons.cloud_download),
// //           ),
// //           SizedBox(width: 10),
// //           FloatingActionButton(
// //             onPressed: _nextVideo,
// //             tooltip: 'Next Video',
// //             child: Icon(Icons.navigate_next),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as htmlParser;
// import 'package:html/dom.dart' as htmlDom;

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   final List<String> _videoLinks = [
//     // Add your Google Drive video links here
//     "https://drive.google.com/file/d/1JHX2Z0kslFr3zcGhsfw5RupEs7ZiWPgd/view?usp=sharing",
//     'https://drive.google.com/file/d/1HmVkJviyH_F6qwnU2-HOWJgpsunTylol/view?usp=sharing',
//     'https://drive.google.com/file/d/1sqYGF1UiQJmO3xl-Ur6DJD4BFn4J2FyZ/view?usp=sharing',
//   ];
//   int _currentVideoIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _initializePlayer();
//   }

//   void _initializePlayer() {
//     _controller = VideoPlayerController.network(
//       _videoLinks[_currentVideoIndex],
//     );
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.addListener(() {
//       if (_controller.value.isPlaying &&
//           _controller.value.duration == _controller.value.position) {
//         _nextVideo();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _nextVideo() {
//     setState(() {
//       _currentVideoIndex = (_currentVideoIndex + 1) % _videoLinks.length;
//       _controller = VideoPlayerController.network(
//         _videoLinks[_currentVideoIndex],
//       );
//       _initializeVideoPlayerFuture = _controller.initialize();
//       _controller.play();
//     });
//   }

//   Future<void> _downloadVideo() async {
//     final directDownloadLink =
//         await _getDirectDownloadLink(_videoLinks[_currentVideoIndex]);
//     if (directDownloadLink != null) {
//       final response = await http.get(Uri.parse(directDownloadLink));
//       final documentDirectory = await getApplicationDocumentsDirectory();
//       final file =
//           File('${documentDirectory.path}/video$_currentVideoIndex.mp4');
//       file.writeAsBytesSync(response.bodyBytes);
//       setState(() {
//         _controller = VideoPlayerController.file(file);
//         _initializeVideoPlayerFuture = _controller.initialize();
//       });
//     }
//   }

//   Future<String?> _getDirectDownloadLink(String googleDriveLink) async {
//     final response = await http.get(Uri.parse(googleDriveLink));
//     final document = htmlParser.parse(response.body);
//     final scripts = document.getElementsByTagName('script');
//     String? directDownloadLink;

//     for (var script in scripts) {
//       if (script.text.contains('window.location.replace("')) {
//         final start = script.text.indexOf('window.location.replace("') +
//             'window.location.replace("'.length;
//         final end = script.text.indexOf('");', start);
//         final redirectUrl = script.text.substring(start, end);
//         final directDownloadResponse = await http.get(Uri.parse(redirectUrl));
//         final directDownloadDocument =
//             htmlParser.parse(directDownloadResponse.body);
//         final links = directDownloadDocument.getElementsByTagName('a');
//         directDownloadLink = links
//             .firstWhere(
//               (element) => element.attributes['download'] != null,
//               // orElse: () => null,
//             )
//             ?.attributes['href'];
//         if (directDownloadLink != null) {
//           break;
//         }
//       }
//     }

//     return directDownloadLink;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player Demo'),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               );
//             } else {
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: _downloadVideo,
//             tooltip: 'Download Video',
//             child: Icon(Icons.cloud_download),
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: _nextVideo,
//             tooltip: 'Next Video',
//             child: Icon(Icons.navigate_next),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final List<String> _videoLinks = [
    "https://drive.google.com/uc?export=view&id=1HmVkJviyH_F6qwnU2-HOWJgpsunTylol",
    "https://drive.google.com/uc?export=view&id=1sqYGF1UiQJmO3xl-Ur6DJD4BFn4J2FyZ",
    "https://youtu.be/s1_lwfREvog?si=AMh6vTegvG31SMtu",
    "https://drive.google.com/file/d/1JHX2Z0kslFr3zcGhsfw5RupEs7ZiWPgd/view?usp=sharing",
    "https://drive.google.com/file/d/1HmVkJviyH_F6qwnU2-HOWJgpsunTylol/view?usp=sharing",
    "https://drive.google.com/file/d/1sqYGF1UiQJmO3xl-Ur6DJD4BFn4J2FyZ/view?usp=sharing",
  ];
  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = VideoPlayerController.network(
      _videoLinks[_currentVideoIndex],
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      if (_controller.value.isPlaying &&
          _controller.value.duration == _controller.value.position) {
        _nextVideo();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextVideo() {
    setState(() {
      _currentVideoIndex = (_currentVideoIndex + 1) % _videoLinks.length;
      _controller = VideoPlayerController.network(
        _videoLinks[_currentVideoIndex],
      );
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
    });
  }

  Future<void> _downloadVideo() async {
    final response = await http.get(Uri.parse(_videoLinks[_currentVideoIndex]));
    final documentDirectory = await getApplicationDocumentsDirectory();
    final file = File('${documentDirectory.path}/video$_currentVideoIndex.mp4');
    file.writeAsBytesSync(response.bodyBytes);
    setState(() {
      _controller = VideoPlayerController.file(file);
      _initializeVideoPlayerFuture = _controller.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Demo'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _downloadVideo,
            tooltip: 'Download Video',
            child: Icon(Icons.cloud_download),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _nextVideo,
            tooltip: 'Next Video',
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
