import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/layout_controller.dart';
import 'package:states_rebuilder/scr/state_management/extensions/reactive_model_x.dart';

class VoxelGrid extends StatelessWidget {
  VoxelGrid({super.key});

  final c = layoutController.state;

  @override
  Widget build(BuildContext context) {
    return layoutController.rebuild(
      () => Center(
        child: GestureDetector(
          onPanUpdate: (details) => c.onPanUpdateHandler(details),
          child: Transform(
            alignment: Alignment.center, // Add t
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(c.offset.dy * pi / 180)
              ..rotateY(c.offset.dx * pi / 180),
            child: Stack(
              children: [
                Container(
                  color: Colors.pink,
                  height: 200,
                  width: 200,
                ),
                Container(
                  color: Colors.teal,
                  height: 200,
                  width: 200,
                  transform: Matrix4.identity()..rotateY(pi / 2),
                  transformAlignment: Alignment.center,
                ),
                Container(
                  color: Colors.orange,
                  height: 200,
                  width: 200,
                  transform: Matrix4.identity()..rotateX(pi / 2),
                  transformAlignment: Alignment.center,
                  child: _DotGrid(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DotGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        30,
        (int index) => Row(
          children: List.generate(
            30,
            (int index) => Container(
              height: 3,
              width: 3,
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
