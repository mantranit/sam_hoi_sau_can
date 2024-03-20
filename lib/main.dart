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
      home: const MyHomePage(title: 'Sám hối sáu căn'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/mds/samhoisaucan.md');
  }

  final assetsAudioPlayer = AssetsAudioPlayer();
  final audio = Audio("assets/audios/samhoisaucan1a.mp3");
  var markdownData = '';

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      audio,
      autoStart: false,
    );
    loadAsset().then((value) => {
          setState(() {
            markdownData = value;
          })
        });
  }

  void _playOrPause() {
    setState(() {
      assetsAudioPlayer.playOrPause();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool playing = assetsAudioPlayer.isPlaying.value;
    return Scaffold(
      body: SafeArea(
          child: Markdown(
        data: markdownData,
        selectable: false,
        styleSheet: MarkdownStyleSheet(
            p: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            h1: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            h2: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            h3: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            h4: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _playOrPause,
        tooltip: !playing ? 'Play' : 'Pause',
        child: !playing ? const Icon(Icons.play_arrow) : const Icon(Icons.stop),
      ),
    );
  }
}
