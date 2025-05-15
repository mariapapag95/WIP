import 'package:flutter/material.dart';
import 'package:scrapbook/views/styles.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var themeController = RM.inject(() => ThemeController());
var themeControllerState = themeController.state;

class ThemeController {
  ThemeData theme = Styles().lightTheme;

  void changeTheme(ThemeData themeData) {
    theme = themeData;
    themeController.notify();
  }
}
