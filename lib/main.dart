import 'package:flutter/material.dart';

import 'pantallas/inicio_pantalla.dart';
import 'tema.dart';

void main() => runApp(const MiraLocalApp());

class MiraLocalApp extends StatelessWidget {
  const MiraLocalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mira Local',
      theme: temaMiraLocal(),
      home: const InicioPantalla(),
    );
  }
}
