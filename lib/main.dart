// Copyright (c) 2023 KibaOfficial
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:bmi_calc/pages/home.dart';

// local
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0321),
        colorScheme: ThemeData.dark().colorScheme.copyWith(secondary: Colors.pink),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),),
      home: const Home(),
    );
  }
}
