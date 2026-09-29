import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const LastMinuteDealApp());

class LastMinuteDealApp extends StatelessWidget {
  const LastMinuteDealApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Last Minute Deal',
        theme: appTheme,
        home: const HomeScreen(),
      );
}
