import 'dart:io';

import 'package:flutter/material.dart';

Widget BaseInkWell({
  required Widget child,
  required GestureTapCallback? onTap,
  Function(TapDownDetails)? onTapDown,
  Function(TapUpDetails)? onTapUp,
}) {
  if (Platform.isIOS) {
    return GestureDetector(
      child: child,
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
    );
  } else {
    return InkWell(
      child: child,
      onTap: onTap,
    );
  }
}
