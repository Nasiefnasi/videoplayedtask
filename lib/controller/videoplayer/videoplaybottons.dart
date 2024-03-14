// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerControllers extends GetxController{
//   final List<String> _videoUrls = [
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005771.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005772.mp4",
//     "https://lamamiablogs.s3.ap-south-1.amazonaws.com/document_6309864315730005770.mp4",
//   ];
//   late List<VideoPlayerController> _controllers;
// int _currentVideoIndex = 0;

 
// void _playPause() {
    
//       if (_controllers[_currentVideoIndex].value.isPlaying) {
//         _controllers[_currentVideoIndex].pause();
//       } else {
//         _controllers[_currentVideoIndex].play();
//       }
    
//   }
//   void _nextVideo() {
   
//       if (_currentVideoIndex < _videoUrls.length - 1) {
//         _currentVideoIndex++;
//       } else {
//         _currentVideoIndex = 0; // Go back to the first video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
   
//   }
//   void _previousVideo() {
    
//       if (_currentVideoIndex > 0) {
//         _currentVideoIndex--;
//       } else {
//         _currentVideoIndex = _videoUrls.length - 1; // Go to the last video
//       }
//       _controllers[_currentVideoIndex].seekTo(Duration.zero);
//       _controllers[_currentVideoIndex].play();
 
//   }
//    void _fastForward() {
   
//       final newPosition = _controllers[_currentVideoIndex].value.position +
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
  
//   }
//    void _rewind() {
   
//       final newPosition = _controllers[_currentVideoIndex].value.position -
//           Duration(seconds: 10);
//       _controllers[_currentVideoIndex].seekTo(newPosition);
   
//   }
// }






