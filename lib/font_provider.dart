import 'package:flutter/material.dart';
import 'package:theme_demo/constants.dart';

class FontProvider extends ChangeNotifier {
  double? titleSmall = titleSmallFont;
  // TextStyle textStyle;

  void update({double? value}) {
    titleSmall = titleSmallFont * value!;

    // fontSize = value;
    // print(fontSize);
    notifyListeners();
  }
}
