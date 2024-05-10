import 'package:flutter/material.dart';
import 'package:flutter_app_features/screens/dependent_multilevel_dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DependentMultilevelDropdown(),
    );
  }
}

