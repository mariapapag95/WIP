import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/to_do_controller.dart';


class Sphere extends StatelessWidget {
   Sphere({super.key});

  final c = toDoController.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) =>
              c.onPanUpdateHandler(details),
          child: Transform.rotate(
            angle: c.angle,
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
