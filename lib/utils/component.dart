import 'package:flutter/material.dart';

//box decoration with outline borders

BoxDecoration kOutlineBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    border: Border.all(width: width, color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

//box decoration with fill box colors

BoxDecoration kFillBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    color: color,
    border:
        Border.all(width: width, color: const Color.fromRGBO(219, 219, 219, 1)),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}
