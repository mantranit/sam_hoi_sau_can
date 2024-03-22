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
      title: 'Sám Hối Sáu Căn',
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
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/mds/samhoisaucan.md');
  }

  late AssetsAudioPlayer _assetsAudioPlayer;
  var markdownData = '';
  var fontSizeBase = 18.0;
  var isShowButtons = false;

  final audio = Audio("assets/audios/samhoisaucan1a.mp3");

  @override
  void initState() {
    super.initState();
    loadBook();

    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    openPlayer();
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
          data: markdownData,
          selectable: false,
          styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                  fontSize: fontSizeBase,
                  fontWeight: FontWeight.bold,
                  height: 1.5),
              h1: TextStyle(
                  fontSize: fontSizeBase * 1.725, fontWeight: FontWeight.bold),
              h2: TextStyle(
                  fontSize: fontSizeBase * 1.5, fontWeight: FontWeight.bold),
              h3: TextStyle(
                  fontSize: fontSizeBase * 1.25, fontWeight: FontWeight.bold),
              h4: TextStyle(
                  fontSize: fontSizeBase * 1.125, fontWeight: FontWeight.bold)),
        )),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              mini: true,
              onPressed: () => setState(() {
                isShowButtons = !isShowButtons;
              }),
              tooltip: isShowButtons ? 'Collapse' : 'Expand',
              child: isShowButtons
                  ? const Icon(Icons.expand_more)
                  : const Icon(Icons.expand_less),
            ),
            isShowButtons
                ? Column(
                    children: [
                      fontSizeBase < 30
                          ? Column(children: [
                              const SizedBox(height: 16),
                              FloatingActionButton(
                                onPressed: () => setState(() {
                                  fontSizeBase += 1.0;
                                }),
                                tooltip: 'Increase',
                                child: const Text('A+',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )
                            ])
                          : const SizedBox(),
                      fontSizeBase > 16
                          ? Column(children: [
                              const SizedBox(height: 16),
                              FloatingActionButton(
                                onPressed: () => setState(() {
                                  fontSizeBase -= 1.0;
                                }),
                                tooltip: 'Decrease',
                                child: const Text('A-',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )
                            ])
                          : const SizedBox(),
                      _assetsAudioPlayer.builderRealtimePlayingInfos(
                          builder: (context, RealtimePlayingInfos? infos) {
                        if (infos != null &&
                            infos.currentPosition > Duration.zero) {
                          return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16),
                                FloatingActionButton(
                                    onPressed: () => _assetsAudioPlayer.stop(),
                                    tooltip: 'Stop',
                                    child: const Icon(Icons.stop))
                              ]);
                        }
                        return const SizedBox();
                      }),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            _assetsAudioPlayer.builderIsPlaying(builder: (context, isPlaying) {
              return FloatingActionButton(
                onPressed: () => _assetsAudioPlayer.playOrPause(),
                tooltip: !isPlaying ? 'Play' : 'Pause',
                child: !isPlaying
                    ? const Icon(Icons.play_arrow)
                    : const Icon(Icons.pause),
              );
            }),
          ],
        ));
  }
}
