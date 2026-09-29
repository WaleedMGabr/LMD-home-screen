import 'package:flutter/material.dart';

const navy = Color(0xFF111A2B);
const subtleText = Color(0xFF98A4B8);
const line = Color(0xFFE3E7ED);

final appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Arial',
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: navy),
);

BoxDecoration outlined({required double radius, bool shadow = false}) =>
    BoxDecoration(
      color: Colors.white,
      border: Border.all(color: line),
      borderRadius: BorderRadius.circular(radius),
      boxShadow: shadow
          ? const [
              BoxShadow(
                color: Color(0x0B152038),
                blurRadius: 20,
                offset: Offset(0, 6),
              ),
            ]
          : null,
    );
