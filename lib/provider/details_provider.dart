import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  double? weight;
  double? height;

  void setWeight(double enteredWeight) {
    weight = enteredWeight;
    print(" weight is    $weight");
    notifyListeners();
  }

  void setHeight(double enteredHeight) {
    height = enteredHeight;
    print(" height is    $height");
    notifyListeners();
  }
}
