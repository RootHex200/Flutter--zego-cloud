import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/view/homepage/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zego Audio Video Calling',
      home: Homepage(),
    );
  }
}
