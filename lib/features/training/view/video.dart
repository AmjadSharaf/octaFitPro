// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const VideosPage(),
//     );
//   }
// }

// // 🔥 قائمة الفيديوهات
// class VideosPage extends StatelessWidget {
//   const VideosPage({super.key});

//   final List<Map<String, String>> videos = const [
//     {'path': 'assets/videos/video1.mp4', 'title': 'Full Body Workout'},
//     {'path': 'assets/videos/video2.mp4', 'title': 'Cardio Burn'},
//     {'path': 'assets/videos/video3.mp4', 'title': 'Abs Workout'},
//     {'path': 'assets/videos/video4.mp4', 'title': 'Upper Body'},
//     {'path': 'assets/videos/video5.mp4', 'title': 'Leg Day'},
//     {'path': 'assets/videos/video6.mp4', 'title': 'HIIT Training'},
//     {'path': 'assets/videos/video7.mp4', 'title': 'Stretching'},
//     {'path': 'assets/videos/video8.mp4', 'title': 'Yoga Flow'},
//     {'path': 'assets/videos/video9.mp4', 'title': 'Core Strength'},
//     {'path': 'assets/videos/video10.mp4', 'title': 'Cool Down'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Workout Videos'),
//         backgroundColor: const Color(0xFF1F3169),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: videos.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 16),
//             child: VideoCard(
//               videoPath: videos[index]['path']!,
//               title: videos[index]['title']!,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // 🎬 كرت الفيديو
// class VideoCard extends StatefulWidget {
//   final String videoPath;
//   final String title;

//   const VideoCard({
//     super.key,
//     required this.videoPath,
//     required this.title,
//   });

//   @override
//   State<VideoCard> createState() => _VideoCardState();
// }

// class _VideoCardState extends State<VideoCard> {
//   VideoPlayerController? _controller;
//   bool _isLoading = true;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _initVideo();
//   }

//   void _initVideo() async {
//     try {
//       _controller = VideoPlayerController.asset(widget.videoPath);

//       // ⚡ مهم: استمع للأخطاء
//       _controller!.addListener(() {
//         if (_controller!.value.hasError && mounted) {
//           setState(() {
//             _error = _controller!.value.errorDescription;
//             _isLoading = false;
//           });
//         }
//       });

//       await _controller!.initialize();

//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           _error = e.toString();
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   void _togglePlay() {
//     if (_controller == null) return;
//     _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: const Color(0xFF1F3169),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // العنوان
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
//             child: Text(
//               widget.title,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),

//           // الفيديو
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: _buildVideoWidget(),
//             ),
//           ),

//           // أزرار التحكم
//           if (_error == null && !_isLoading)
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: _togglePlay,
//                     icon: Icon(
//                       _controller?.value.isPlaying ?? false
//                           ? Icons.pause_circle_filled
//                           : Icons.play_circle_filled,
//                       size: 40,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Expanded(
//                     child: VideoProgressIndicator(
//                       _controller!,
//                       allowScrubbing: true,
//                       colors: const VideoProgressColors(
//                         playedColor: Colors.red,
//                         bufferedColor: Colors.grey,
//                         backgroundColor: Colors.white24,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       _controller?.setVolume(
//                         (_controller!.value.volume) > 0 ? 0 : 1,
//                       );
//                       setState(() {});
//                     },
//                     icon: Icon(
//                       (_controller?.value.volume ?? 0) > 0
//                           ? Icons.volume_up
//                           : Icons.volume_off,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//           const SizedBox(height: 8),
//         ],
//       ),
//     );
//   }

//   Widget _buildVideoWidget() {
//     // حالة التحميل
//     if (_isLoading) {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: CircularProgressIndicator(color: Colors.red),
//         ),
//       );
//     }

//     // حالة الخطأ
//     if (_error != null) {
//       return Container(
//         color: Colors.black,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.error_outline, color: Colors.red, size: 40),
//               const SizedBox(height: 8),
//               Text(
//                 'Error: $_error',
//                 style: const TextStyle(color: Colors.white),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     // الفيديو شغّال
//     return VideoPlayer(_controller!);
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }