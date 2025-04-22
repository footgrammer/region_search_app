import 'package:flutter/material.dart';
import 'package:region_search_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지역 검색 앱',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Color.fromARGB(255, 253, 240, 255),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 253, 240, 255),
        ),
      ),
      home: HomePage(),
    );
  }
}
