import 'package:bmi_calculator/provider/details_provider.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/utils/theme_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DetailsProvider(),
        )
      ],
      child: MaterialApp(
        theme: kLightTheme,
        home: const Scaffold(
          body: Center(
            child: SplashScreen(),
          ),
        ),
      ),
    ),
  );
}
