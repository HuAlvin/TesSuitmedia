import 'package:belajar_1/data/list_account.dart';
import 'package:belajar_1/screen/first_screen.dart';
import 'package:belajar_1/screen/first_screen.dart';
import 'package:belajar_1/screen/second_screen.dart';
import 'package:belajar_1/screen/third_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}