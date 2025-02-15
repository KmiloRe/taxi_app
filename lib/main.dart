import 'package:flutter/material.dart';
import 'package:taxi_app/search_taxi_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxis demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 31, 58, 193)),
        useMaterial3: true,
      ),
      home: const SearchTaxiSection(),
    );
  }
}
