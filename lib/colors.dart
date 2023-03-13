import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static final MaterialColor primeryColorOne =
      MaterialColor(0xFF0065ff, colorValues);
}

const Color? primeryColorOneTypeColor = Color(0xFF0065ff);

Map<int, Color> colorValues = const {
  50: Color.fromRGBO(0, 101, 255, .1),
  100: Color.fromRGBO(0, 101, 255, .2),
  200: Color.fromRGBO(0, 101, 255, .3),
  300: Color.fromRGBO(0, 101, 255, .4),
  400: Color.fromRGBO(0, 101, 255, .5),
  500: Color.fromRGBO(0, 101, 255, .6),
  600: Color.fromRGBO(0, 101, 255, .7),
  700: Color.fromRGBO(0, 101, 255, .8),
  800: Color.fromRGBO(0, 101, 184, .9),
  900: Color.fromRGBO(0, 101, 255, 1),
};

extension ToMaterial on Color? {
  MaterialColor? toMaterial() {
    // print("to hex ${this!.toIntColor()}");
    return MaterialColor(this!.toIntColor() ?? 0xFF0065ff, {
      50: Color(this!.toIntColor()!).withOpacity(.1),
      100: Color(this!.toIntColor()!).withOpacity(.2),
      200: Color(this!.toIntColor()!).withOpacity(.3),
      300: Color(this!.toIntColor()!).withOpacity(.4),
      400: Color(this!.toIntColor()!).withOpacity(.5),
      500: Color(this!.toIntColor()!).withOpacity(.6),
      600: Color(this!.toIntColor()!).withOpacity(.7),
      700: Color(this!.toIntColor()!).withOpacity(.8),
      800: Color(this!.toIntColor()!).withOpacity(.9),
      900: Color(this!.toIntColor()!).withOpacity(.10),
    });
  }
}

extension ToIntColor on Color? {
  int? toIntColor() {
    String hexColor = this!.toHex();
    // log("hex  color is $hexColor");
    String subString = '0xFF${hexColor.substring(3)}';
    // log("converted int color is ${subString}");
    return int.tryParse(
      subString,
    );
  }
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

///* below dunction is to check which color visible clearly on selected color

bool useWhiteForeground(Color backgroundColor, {double bias = 0.0}) {
  // Old:
  // return 1.05 / (color.computeLuminance() + 0.05) > 4.5;

  // New:
  int v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
          pow(backgroundColor.green, 2) * 0.587 +
          pow(backgroundColor.blue, 2) * 0.114)
      .round();
  return v < 130 + bias ? true : false;
}
