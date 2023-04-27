import 'package:flutter/material.dart';
import 'package:gift_explore/widgets/text.dart';

class AppWidget {
  AppText _appText = AppText();
  sizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 0,
      width: width ?? 0,
    );
  }

  // button
  appButton({
    Color? color,
    Color? bgColor,
    double? size,
    Color? borderColor,
    String? text,
    IconData? icon,
    bool? isIcon,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(18),
        color: bgColor,
      ),
      child: Center(
        child: isIcon == false
            ? _appText.smallText(text: text, color: color)
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
