import 'package:flutter/material.dart';
import 'package:sam_hoi_sau_can/screens/home_screen.dart';
import 'package:sam_hoi_sau_can/screens/splash_screen.dart';
import 'package:sam_hoi_sau_can/storages/font_size.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade600),
        useMaterial3: true,
      ),
      home: HomeScreen(storage: FontSizeStorage()),
    );
  }
}
