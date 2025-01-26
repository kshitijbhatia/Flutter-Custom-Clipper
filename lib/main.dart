import 'package:custom_clipper/custom_background.dart';
import 'package:custom_clipper/custom_clipper_1.dart';
import 'package:custom_clipper/custom_clipper_2.dart';
import 'package:custom_clipper/custom_clipper_3.dart';
import 'package:custom_clipper/custom_clipper_4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CustomBackground(),
    );
  }
}
