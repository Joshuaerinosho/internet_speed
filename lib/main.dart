import 'package:flutter/material.dart';
import 'theme_data.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Speed',
      theme: appThemeData,
      home: const HomeScreen(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
