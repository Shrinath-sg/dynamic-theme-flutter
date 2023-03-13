import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  double? fontSize;
  // TextStyle textStyle;

  void update(double? value) {
    fontSize = value;
    print(fontSize);
    notifyListeners();
  }
}
