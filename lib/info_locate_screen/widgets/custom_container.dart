import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme_provider.dart';



class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.child,
      this.height,
      this.width,
      this.onTap,
      this.buttonRadius,
      this.borderRadius});
  final Widget? child;
  final double? height;
  final double? width;
  final double? buttonRadius;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: themeProvider.isDartMode
                ? Theme.of(context).cardColor
                : Theme.of(context).cardColor,
            borderRadius: borderRadius ??
                BorderRadius.all(Radius.circular(buttonRadius ?? 20))),
        child: child,
      ),
    );
  }
}

//  this property is null then the ambient [CardTheme.color] is used. If that is null, and [ThemeData.useMaterial3] is true, then [ColorScheme.surface] of [ThemeData.colorScheme] is used. Otherwise, [ThemeData.cardColor] is used.
