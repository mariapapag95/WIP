import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

var layoutController = RM.inject(() => LayoutController());
var layoutControllerState = layoutController.state;

class LayoutController {
  Offset offset = Offset.zero;

  void onPanUpdateHandler(DragUpdateDetails details) {
    print(details.delta);
    offset += details.delta;
    layoutController.notify();
  }
}
