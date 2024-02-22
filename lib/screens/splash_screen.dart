import 'dart:async';

import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/utils/functions.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Image.asset(
        'assets/icon/appIcon.png',
        height: 200,
        width: 200,
      ),
    );
  }
}
