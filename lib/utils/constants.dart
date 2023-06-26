import 'package:flutter/material.dart';

// COlORS

const primary = Color(0xFFD8C8E8);
const redColor = Color.fromRGBO(227, 48, 48, 1);
const cyanColor = Color.fromRGBO(48, 227, 178, 1);

const textColor = Color.fromRGBO(106, 106, 106, 1);
const grey = Color.fromRGBO(0, 0, 0, 0.4);

const black = Colors.black;
const white = Colors.white;

// Size with MediaQuery

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// Custom sizebox use for some spacing

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalySpace(double width) {
  return SizedBox(width: width);
}

// TEXT STYLES

TextStyle kBodyText12wBold(Color color) {
  return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold);
}

TextStyle kBodyText10wBold(Color color) {
  return TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold);
}

TextStyle kBodyText12wNormal(Color color) {
  return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.normal);
}

TextStyle kBodyText10wNormal(Color color) {
  return TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.normal);
}

TextStyle kBodyText11wNormal(Color color) {
  return TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.normal);
}

TextStyle kBodyText11w500(Color color) {
  return TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w500);
}

TextStyle kBodyText14wBold(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold);
}

TextStyle kBodyText14wNormal(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.normal);
}

TextStyle kBodyText14w500(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500);
}

TextStyle kBodyText15wNormal(Color color) {
  return TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.normal);
}

TextStyle kBodyText16wBold(Color color) {
  return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w700);
}

TextStyle kBodyText16wNormal(Color color) {
  return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal);
}

TextStyle kBodyText28wBold(Color color) {
  return TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w600);
}
