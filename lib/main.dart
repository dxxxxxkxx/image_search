import 'package:flutter/material.dart';

import 'ui/main_screen.dart';

void main() {
  runApp(const ImageSearch());
}

class ImageSearch extends StatelessWidget {
  const ImageSearch({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
