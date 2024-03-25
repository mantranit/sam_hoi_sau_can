import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import '../constant.dart';
import '../storages/font_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.storage});
  final FontSizeStorage storage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString(pathMarkdownFile);
  }

  final audio = Audio(pathAudioFile);

  late AssetsAudioPlayer _assetsAudioPlayer;
  String markdownData = '';
  double fontSizeBase = defaultFontSize;
  bool isShowButtons = false;

  @override
  void initState() {
    super.initState();
    widget.storage.readFromFile().then((value) {
      setState(() {
        fontSizeBase = value;
      });
    });
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

  void _changeFontSize(double step) {
    setState(() {
      fontSizeBase += step;
      widget.storage.writeToFile(fontSizeBase);
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
                                onPressed: () => _changeFontSize(1.0),
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
                                onPressed: () => _changeFontSize(-1.0),
                                tooltip: 'Decrease',
                                child: const Text('A-',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )
                            ])
                          : const SizedBox(),
                      _assetsAudioPlayer.builderRealtimePlayingInfos(builder:
                          (context, RealtimePlayingInfos? playingInfo) {
                        if (playingInfo != null &&
                            playingInfo.currentPosition > Duration.zero) {
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
