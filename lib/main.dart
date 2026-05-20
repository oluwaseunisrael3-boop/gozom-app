import 'package:flutter/material.dart';
import 'theme.dart';
import 'home_page.dart';

void main() {
  runApp(const GozomApp());
}

class GozomApp extends StatelessWidget {
  const GozomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOZOM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GozomTheme.darkBg,
        primaryColor: GozomTheme.primaryGold,
        appBarTheme: const AppBarTheme(
          backgroundColor: GozomTheme.deepBlue,
          elevation: 0,
        ),
      ),
      home: const GozomHomePage(),
    );
  }
}
