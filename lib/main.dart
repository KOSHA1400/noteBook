import 'package:flutter/material.dart';
import 'package:notebook/screens/home_screen.dart';
import 'package:notebook/utils/network.dart';
import 'dart:ffi';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NetWork.getData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'دفترچه تلفن انلاین',

      home: const HomeScreen(),
    );
  }
}

