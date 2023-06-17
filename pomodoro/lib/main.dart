import 'package:flutter/material.dart';
import 'package:pomodoro/screens/home_scree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // stateless widget just build ui
  // state widget chage data in real time
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // context contains information of widget inspector
    return MaterialApp(
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: const Color(0xFFE7626C)),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF232B55),
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
        ),
        home: const HomeScreen());
  }
}
