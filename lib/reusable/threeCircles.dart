
import 'package:flutter/material.dart';

Container ThreeCircles({Widget child}) {
  return Container(
    child: child,
    decoration: BoxDecoration(
        shape: BoxShape.circle, color: Color(0xff909090).withOpacity(0.2)),
    height: 40,
    width: 40,
  );
}