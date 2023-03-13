import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_demo/colors.dart';
import 'package:theme_demo/constants.dart';
import 'package:theme_demo/font_provider.dart';

class Global {
  static AdaptiveThemeMode? savedThemeMode;
  static int? savedThemeColor;

   void setCustomTheme(
      {required BuildContext context,
      required Color? themeColor,
      required double? fontSize}) {
    AdaptiveTheme.of(context).setTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: themeColor!.toMaterial(),
          textTheme: const TextTheme().copyWith(
              titleSmall: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: fontSize!))),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: themeColor.toMaterial(),
          textTheme: const TextTheme().copyWith(
              titleSmall: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: fontSize))

          // primarySwatch: AppColors.primeryColorOne,
          // floatingActionButtonTheme: FloatingActionButtonThemeData(
          //     backgroundColor: AppColors.primeryColorOne),
          // iconTheme: const IconThemeData(color: Colors.red),
          ),
    );
  }
}
