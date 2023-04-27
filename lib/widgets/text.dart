import 'package:flutter/material.dart';

class AppText {
  largeText({double? size, String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.black87,
        fontSize: size ?? 40,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  mediumText({double? size, String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.black54,
        fontSize: size ?? 24,
        overflow: TextOverflow.ellipsis,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  smallText({double? size, String? text, Color? color}) {
    return Text(
      text!,
      style: TextStyle(
        color: color ?? Colors.black54,
        fontSize: size ?? 16,
        // overflow: TextOverflow.ellipsis,
      ),
      // overflow: TextOverflow.ellipsis,
    );
  }
}
