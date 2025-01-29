import 'package:bmicalculator/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'screens/imput_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
         '/' : (context) => InputPage(title: 'title'),
        '/results': (context) => ResultPage(interpretation: 'sds', bmiResult: '22',resultText:  '22',)
      },
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0A0E21)
        ,primary: const Color(0xFF0A0E21),
        secondary: const Color(0xFFEB1555)),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: const Color(0xFFEB1555), // Color para títulos grandes
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey.shade700, // Color para texto principal
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            color: Colors.grey.shade500, // Color para texto secundario
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
