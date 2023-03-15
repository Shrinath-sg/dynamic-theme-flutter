import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_container.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn(
      {super.key, this.icon, this.title, this.direction = Axis.horizontal});
  final IconData? icon;
  final String? title;

  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: CustomContainer(
        buttonRadius: 14,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Flex(
            direction: direction,
            children: [
              Icon(
                icon,
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: direction == Axis.horizontal ?  4.w: 0,
                height: direction == Axis.horizontal ?  0: 2.w,
              ),
              Text(title ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
