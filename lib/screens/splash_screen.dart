import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sam_hoi_sau_can/screens/home_screen.dart';
import 'package:sam_hoi_sau_can/storages/font_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => HomeScreen(storage: FontSizeStorage())));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white70],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(image: AssetImage('assets/images/launch_image.png'), width: 200),
        SizedBox(height: 20),
        Text('Sám Hối Sáu Căn',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        Text('Nghi thức sám hối và tụng giới',
            style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
      ]),
    ));
  }
}
