import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
};

IconData stringToIconPresenter(String iconName) =>
    _icons[iconName] ?? Icons.star;
