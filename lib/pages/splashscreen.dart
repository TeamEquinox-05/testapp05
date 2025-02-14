import 'package:flutter/material.dart';
import 'package:testapp01/pages/homepage.dart';
import 'package:testapp01/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) { // Ensure widget is still in the tree
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Homepage()),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Center(
          
          child: Container(
            height: 300,
            width: 300,
            child: Image.asset('assets/images/logo.png'),
          ),
         )
      ])
    );
  }
}