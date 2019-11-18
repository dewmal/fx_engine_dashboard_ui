import 'package:flutter/material.dart';

const color01 = Color(0xFF07090F);
const color02 = Color(0xFF33AC48);
const color03 = Color(0xFFE84C4C);
const color04 = Color(0xFF967472);
const color05 = Color(0xFF36425E);
const color06 = Color(0xFF535BB6);
const color07 = Color(0xFFA5B7C3);
const color08 = Color(0xFF535BB6);
const color09 = Color(0xFFA8ADD8);
const color10 = Color(0xFF21289D);
const color11 = Color(0xFFF1F1F6);
const color12 = Color(0xFF333333);

const bullSignalColor = color02;
const bearishSignalColor = color03;

const primaryColor = color08;
const accentColor = color07;

var defaultTheme = ThemeData(
// Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  accentColor: accentColor,

// Define the default font family.
  fontFamily: 'Raleway',

// Define the default TextTheme. Use this to specify the default
// text styling for headlines, titles, bodies of text, and more.
  textTheme: TextTheme(
    headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    subhead: TextStyle(fontSize: 54.0, fontWeight: FontWeight.normal),
    title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
    subtitle: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
    body1: TextStyle(fontSize: 14.0),
    body2: TextStyle(fontSize: 14.0, fontFamily: "OpenSans"),
    display1: TextStyle(fontSize: 12.0),
    display2: TextStyle(fontSize: 12.0, fontFamily: "OpenSans"),
    display3: TextStyle(fontSize: 12.0),
    display4: TextStyle(fontSize: 12.0, fontFamily: "OpenSans"),
    button: TextStyle(fontSize: 12.0),
    caption: TextStyle(fontSize: 12.0),
    overline: TextStyle(fontSize: 12.0),
  ),
);
