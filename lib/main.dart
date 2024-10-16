import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screens/categories_screen.dart';
import 'package:myapp/screens/meals_screen.dart';
import 'package:myapp/data/dummy_data.dart';
import 'package:myapp/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(250, 255, 146, 63),
      brightness: Brightness.dark,
    ),
    textTheme: GoogleFonts.latoTextTheme());

void main() {
  runApp(
    const ProviderScope(child: App())
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen());
  }
}
