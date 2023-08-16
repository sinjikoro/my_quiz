import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = StateProvider<String>((ref) => 'Shinji');

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyQuiz',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Placeholder(),
    );
  }
}
