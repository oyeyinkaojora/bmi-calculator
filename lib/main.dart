import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF0A0E21),
    scaffoldBackgroundColor: const Color(0xFF0A0E21),
  ),
  home: const InputPage() ,
));


