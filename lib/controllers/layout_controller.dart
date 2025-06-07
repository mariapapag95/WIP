import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../views/pages/task_home_page.dart';

var layoutController = RM.inject(() => LayoutController());
var layoutControllerState = layoutController.state;

class LayoutController {
  List<Widget> pages = [TaskHomePage(),];
  Widget? currentPage;
  Offset offset = Offset.zero;

  void selectPage(Widget? page){
    currentPage = page;
    layoutController.notify();
  }

  void onPanUpdateHandler(DragUpdateDetails details) {
    offset += details.delta;
    layoutController.notify();
  }
}
