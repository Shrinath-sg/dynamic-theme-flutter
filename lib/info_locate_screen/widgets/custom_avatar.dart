import 'package:flutter/material.dart';



class CustomAvatar extends StatelessWidget {
  const CustomAvatar(
      {super.key, this.icon, this.bgColor, this.foregroundColor});
  final IconData? icon;
  final Color? bgColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      
      // backgroundColor: bgColor ?? Colors.white,
      foregroundColor: foregroundColor ?? Colors.black,
      radius: 25,
      child: Icon(
        icon ?? Icons.local_activity_rounded,
        size: 25,
      ),
    );
    ;
  }
}
