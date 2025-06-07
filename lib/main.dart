import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/layout_controller.dart';
import 'package:scrapbook/controllers/task_controller.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await taskControllerState.loadTasks();
  runApp(WIP());
}

class WIP extends StatelessWidget {
  WIP({super.key});

  final c = layoutControllerState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WIP',
      theme: themeControllerState.theme,
      home: Scaffold(
        body: layoutController.rebuild(
          () => SafeArea(
            child: c.currentPage ??
                Column(
                  children: [
                    for (final page in c.pages)
                      IconButton(
                        onPressed: () => c.selectPage(page),
                        icon: const Icon(Icons.grading_outlined),
                      )
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
