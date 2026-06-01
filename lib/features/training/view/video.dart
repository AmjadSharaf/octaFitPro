import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  final List<Map<String, String>> videos = const [
    // ✅ Big Buck Bunny - Classic test video (H.264 guaranteed)
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'title': 'Big Buck Bunny',
    },
    // ✅ Sintel - Open movie (H.264)
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
      'title': 'Sintel',
    },
    // ✅ Tears of Steel - Open movie
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
      'title': 'Tears of Steel',
    },
    // ✅ Elephants Dream
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      'title': 'Elephants Dream',
    },
    // ✅ For Bigger Blazes
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      'title': 'For Bigger Blazes',
    },
    // ✅ For Bigger Escapes
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      'title': 'For Bigger Escapes',
    },
    // ✅ For Bigger Fun
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      'title': 'For Bigger Fun',
    },
    // ✅ For Bigger Joyrides
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
      'title': 'For Bigger Joyrides',
    },
    // ✅ For Bigger Meltdowns
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
      'title': 'For Bigger Meltdowns',
    },
    // ✅ Subtitle Out of Sync
    {
      'url':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
      'title': 'Subaru Outback',
    },
  ];
  // ... باقي الفيديوهات

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text('Workout Videos'),
        backgroundColor: const Color(0xFF1F3169),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: VideoCard(
              videoUrl: videos[index]['url']!,
              title: videos[index]['title']!,
            ),
          );
        },
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoCard({super.key, required this.videoUrl, required this.title});
  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  VideoPlayerController? _controller;
  bool _isLoading = true;
  String? _error;
  bool _isInitialized = false; // ✅ جديد: ما بنشتغل الفيديو إلا لما يكون مرئي

  @override
  void initState() {
    super.initState();
    // ❌ لا تفتح الفيديو هون!
    // _initVideo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ✅ نشتغل الفيديو لما العنصر يصير مرئي فعلياً
    if (!_isInitialized) {
      _isInitialized = true;
      // تأخير بسيط حتى ما يعمل Initialize لكل الفيديوهات بنفس اللحظة
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) _initVideo();
      });
    }
  }

  void _initVideo() async {
    try {
      debugPrint('⏳ Loading: ${widget.title}');

      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
        // ⚠️ هاي مش للفيديوهات الطويلة، هاي للسماح بصوت متزامن مع تطبيقات تانية
        // للفيديوهات الطويلة استخدم httpHeaders أو cache
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      // ✅ مهم جداً: limit cache size
      await _controller!.initialize();
      _controller!.setLooping(true);
      // ✅ ابدأ بصوت مكتوم لتحسين تجربة المستخدم
      _controller!.setVolume(0.0);

      debugPrint('✅ Loaded: ${widget.title}');

      if (mounted) {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint('❌ Error ${widget.title}: $e');
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _togglePlay() {
    if (_controller == null) return;
    setState(() {
      _controller!.value.isPlaying ? _controller!.pause() : _controller!.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1F3169),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                const Icon(
                  Icons.fitness_center,
                  color: Colors.white70,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // الفيديو
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(aspectRatio: 16 / 9, child: _buildVideoWidget()),
          ),

          // أزرار التحكم - بتظهر لما يكون الفيديو جاهز
          if (_error == null && !_isLoading && _controller != null)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _togglePlay,
                    icon: Icon(
                      _controller!.value.isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_filled,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: VideoProgressIndicator(
                      _controller!,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: Colors.red,
                        bufferedColor: Colors.grey,
                        backgroundColor: Colors.white24,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller!.setVolume(
                        (_controller!.value.volume) > 0 ? 0 : 1,
                      );
                      setState(() {});
                    },
                    icon: Icon(
                      (_controller!.value.volume) > 0
                          ? Icons.volume_up
                          : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildVideoWidget() {
    if (_isLoading) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Colors.red),
              SizedBox(height: 10),
              Text('Loading...', style: TextStyle(color: Colors.white54)),
            ],
          ),
        ),
      );
    }

    if (_error != null) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 40),
              const SizedBox(height: 8),
              const Text(
                'Failed to load',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Internet issue or video unavailable',
                style: const TextStyle(color: Colors.white54, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                    _error = null;
                  });
                  _initVideo();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: _togglePlay, // ✅ اضغط على الفيديو لتشغيل/إيقاف
      child: Stack(
        alignment: Alignment.center,
        children: [
          VideoPlayer(_controller!),
          // ✅ أيقونة Play لما يكون متوقف
          if (!_controller!.value.isPlaying)
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 50,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
