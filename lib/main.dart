import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  final catRepository = CatRepositoryImpl(httpClient: http.Client());

  runApp(MyApp(catRepository: catRepository));
}

class MyApp extends StatelessWidget {
  final CatRepository catRepository;

  const MyApp({required this.catRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App configuration
      home: HomePage(catRepository: catRepository),
    );
  }
}