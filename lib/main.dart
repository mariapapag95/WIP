import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/theme_controller.dart';
import 'package:scrapbook/views/widgets/sphere.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await viewState.loadTasks();
  runApp(const WIP());
}

class WIP extends StatelessWidget {
  const WIP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WIP',
      theme: themeControllerState.theme,
      home: Sphere(),
    );
  }
}
