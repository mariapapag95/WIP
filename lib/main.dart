import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/task_controller.dart';
import 'package:scrapbook/views/pages/task_home_page.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await taskControllerState.loadTasks();
  runApp(const WIP());
}

class WIP extends StatelessWidget {
  const WIP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WIP',
      theme: themeControllerState.theme,
      home: Scaffold(
        body: SafeArea(
          child: TaskHomePage(),
        ),
      ),
    );
  }
}
