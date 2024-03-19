import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

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
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("assets/audios/samhoisaucan1a.mp3"),
      autoStart: false,
    );
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
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return StickyHeader(
                    header: Container(),
                    content: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(15),
                      // margin: MediaQuery.of(context).padding,
                      child: Column(
                        children: <Widget>[
                          Text(
                            'NGHI THỨC SÁM HỐI VÀ TỤNG GIỚI',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'HT. THIỀN SƯ THÍCH THANH TỪ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          Text(
                            'KỆ NGUYỆN HƯƠNG',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '(Quỳ nguyện hương)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Text(''),
                          Text(
                            'Trầm thuỷ, rừng thiền hương sực nức,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Chiên đàn vườn tuệ đã vun trồng.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Ðao giới vót thành hình non thẳm,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Nguyện đốt lò tâm mãi cúng dâng.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Nam Mô Bồ Tát Hương cúng dường.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '(3 lần rồi đứng lên)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          Text(
                            'TÁN PHẬT',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Ðại từ, đại bi thương chúng sanh,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Ðại hỷ, đại xả cứu hàm thức.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Tướng đẹp sáng ngời dùng trang nghiêm,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Chúng con chí tâm thành đảnh lễ:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '- Chí tâm đảnh lễ: Tất cả chư Phật ba đời, tột hư không khắp pháp giới. (1 lạy)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '- Chí tâm đảnh lễ: Tất cả chánh pháp ba đời, tột hư không khắp pháp giới. (1 lạy)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '- Chí tâm đảnh lễ: Tất cả Tăng, bậc Hiền thánh ba đời, tột hư không khắp pháp giới. (1 lạy)',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          Text(
                            'TÁN PHÁP',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Pháp Phật sâu mầu chẳng gì hơn,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Trăm ngàn muôn kiếp khó được gặp.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Nay con nghe thấy vâng gìn giữ,',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Nguyện hiểu nghĩa chơn đức Thế Tôn.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Qui kính Phật, Bồ Tát trên hội Bát Nhã.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '(3 lần)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          Text(
                            'TÂM KINH TRÍ TUỆ CỨU CÁNH RỘNG LỚN',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Khi Bồ tát Quán Tự Tại hành sâu Bát Nhã Ba la mật đa, ngài soi thấy năm uẩn đều không, liền qua hết thảy khổ ách. (1 chuông)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Này Xá Lợi Phất! Sắc chẳng khác không, không chẳng khác sắc. Sắc tức là không, không tức là sắc, thọ, tưởng, hành, thức cũng lại như thế. (1chuông)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Này Xá Lợi Phất! Tướng không của các pháp không sanh, không diệt, không dơ, không sạch, không thêm, không bớt. Cho nên trong tướng không, không có sắc, không có thọ, tưởng, hành, thức; không có mắt, tai, mũi, lưỡi, thân, ý; không có sắc, thinh, hương, vị, xúc, pháp; không có nhãn giới cho đến không có ý thức giới; không có vô minh cũng không có hết vô minh cho đến không có già chết cũng không có hết già chết; không có khổ, tập, diệt, đạo; không có trí huệ, cũng không có chứng đắc. (1 chuông)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Vì không có chỗ được, nên Bồ tát y theo Bát Nhã Ba la mật đa, tâm không ngăn ngại. Vì không ngăn ngại nên không sợ hãi, xa lìa hẳn điên đảo mộng tưởng, đạt đến cứu cánh Niết bàn. Chư Phật trong ba đời cũng nương Bát Nhã Ba la mật đa, được đạo quả Vô thượng Chánh đẳng chánh giác. Nên biết Bát Nhã Ba la mật đa là đại thần chú, là đại minh chú, là vô thượng chú, là vô đẳng đẳng chú, hay trừ được hết thảy khổ, chơn thật không dối.',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Vì vậy, nói chú Bát Nhã Ba la mật đa, liền nói chú rằng:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '"Yết đế, yết đế, Ba la yết đế, ba la tăng yết đế, Bồ đề tát bà ha". (3 lần)',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Text(''),
                          const Text(''),
                          const Text(''),
                          Text(
                            'BÀI SÁM HỐI SÁU CĂN',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '(Quỳ tụng)',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            '- Chí tâm sám hối:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _playOrPause,
        tooltip: !playing ? 'Play' : 'Pause',
        child: !playing ? const Icon(Icons.play_arrow) : const Icon(Icons.stop),
      ),
    );
  }
}
