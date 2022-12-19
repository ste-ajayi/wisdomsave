import 'package:flutter/material.dart';

Color primarycolor = Color(0xff584BB9);

InputDecoration outInput = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(width: 5),
    borderRadius: BorderRadius.circular(10),
  ),
  isDense: true,
);

ButtonStyle elBtn = ButtonStyle(
  elevation: MaterialStateProperty.all(10),
  backgroundColor: MaterialStateProperty.all(primarycolor),
  padding: MaterialStateProperty.all(
    EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  ),
);
