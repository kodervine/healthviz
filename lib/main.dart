import 'package:flutter/material.dart';
import 'package:healthviz/screens/tabs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 113, 2, 144),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    textTheme: GoogleFonts.leagueSpartanTextTheme(),
    scaffoldBackgroundColor: Colors.white);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealthViz',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(
        tabIndex: 0,
      ),
    );
  }
}
