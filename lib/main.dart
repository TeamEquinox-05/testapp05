import 'package:flutter/material.dart';
import 'package:testapp01/pages/bookings.dart';
import 'package:testapp01/pages/homepage.dart';
import 'package:testapp01/pages/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
