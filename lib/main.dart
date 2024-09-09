//debugShowCheckedModeBanner: false,
import 'package:cifrado_cesar/cifrado.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cifrado Cesar',
      initialRoute: 'cifrado',
      routes: {
        'cifrado': (BuildContext context) => const CifradoCesar(),
      },
    );
  }
}
