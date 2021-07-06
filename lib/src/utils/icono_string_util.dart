import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "slider": Icons.view_carousel,
  "input": Icons.input
};

IconData stringToIconPresenter(String iconName) =>
    _icons[iconName] ?? Icons.star;
