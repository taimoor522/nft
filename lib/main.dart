import 'package:flutter/material.dart';
import 'package:nft/constants.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: kPinkColor,
          elevation: 0,
          iconTheme: IconThemeData(color: kWhiteColor),
        ),
      ),
    );
  }
}
