import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var toDoController = RM.inject(() => ToDoController());
var toDoControllerState = toDoController.state;

class ToDoController {
  DateTime today = DateTime.now();

  double angle = 0.0;

  void onPanUpdateHandler(DragUpdateDetails details) {
    final touchPositionFromCenter = details.localPosition;
    angle = touchPositionFromCenter.direction;
  }
}
