import 'package:flutter/material.dart';

import 'input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        primaryColor: const Color(0x000a0e21),
        scaffoldBackgroundColor: const Color(0x000a0e21),
        appBarTheme: const AppBarTheme(
          color: Color(0x000a0e21),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
          thumbColor: const Color(0xffeb1555),
          activeTrackColor: Colors.white,
          overlayColor: const Color(0xffeb1555).withAlpha(0x29),
          inactiveTrackColor: const Color(0xff8d8e98),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
      },
    );
  }
}
