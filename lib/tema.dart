import 'package:flutter/material.dart';

const kNaranja = Color(0xFFD95D39);
const kCrema = Color(0xFFFAF8F3);
const kCafe = Color(0xFF2B1A12);

ThemeData temaMiraLocal() {
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: kNaranja,
    scaffoldBackgroundColor: kCrema,
  );
}
