import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primarySwatch: Colors.green,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      colorScheme: const ColorScheme.light(
          background: Color.fromRGBO(83, 177, 117, 1.0)),
    ));

final inputBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12));
