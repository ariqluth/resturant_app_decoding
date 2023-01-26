import 'package:flutter/material.dart';

import 'Home Page/home_screen.dart';
import 'Splash Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resturant App',
      routes: {
        "/": (context) => SplashScreen(),
        "/home": (context) => HomePage()
      },
      theme: ThemeData(
        fontFamily: 'nunito',
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
