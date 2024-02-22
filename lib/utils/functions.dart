import 'dart:async';

import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

Timer splashTimer(context) {
  return Timer(
    const Duration(seconds: 3),
    () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    },
  );
}
