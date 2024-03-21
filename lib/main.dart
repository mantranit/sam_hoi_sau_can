import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade600),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollBookController = ScrollController();
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/mds/samhoisaucan.md');
  }

  late AssetsAudioPlayer _assetsAudioPlayer;
  var markdownData = '';

  final audio = Audio("assets/audios/samhoisaucan1a.mp3");

  @override
  void initState() {
    super.initState();
    loadBook();

    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    openPlayer();

    Future.delayed(const Duration(seconds: 1), () {
      scrollBookController.animateTo(
          scrollBookController.position.maxScrollExtent,
          duration: const Duration(seconds: 2),
          curve: Curves.linear);
    });
  }

  void openPlayer() async {
    await _assetsAudioPlayer.open(
      audio,
      autoStart: false,
    );
  }

  void loadBook() async {
    var book = await loadAsset();
    setState(() {
      markdownData = book;
    });
  }

  void _playOrPause() {
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    super.dispose();
    _assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Markdown(
          controller: scrollBookController,
          data: markdownData,
          selectable: false,
          styleSheet: MarkdownStyleSheet(
              p: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              h1: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              h2: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              h3: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              h4: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        )),
        floatingActionButton:
            _assetsAudioPlayer.builderIsPlaying(builder: (context, isPlaying) {
          return FloatingActionButton(
            onPressed: _playOrPause,
            tooltip: !isPlaying ? 'Play' : 'Pause',
            child: !isPlaying
                ? const Icon(Icons.play_arrow)
                : const Icon(Icons.stop),
          );
        }));
  }
}
