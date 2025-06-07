import 'package:flutter/material.dart';
import 'package:scrapbook/controllers/theme_controller.dart';
import 'package:vector_math/vector_math.dart';

class SphereWidget extends StatelessWidget {
  SphereWidget({super.key});

  final Vector3 center = Vector3(0.0, 0.0, 0.0);
  final double radius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: themeControllerState.theme.primaryColor.withValues(alpha: 0.2),
        width: 200,
        height: 200,
        child: CustomPaint(
          size: const Size(200, 200), // Size of the canvas
          painter: SpherePainter(
            sphere: Sphere.centerRadius(center, radius),
          ),
        ),
      ),
    );
  }
}

class SpherePainter extends CustomPainter {
  final Sphere sphere;

  SpherePainter({required this.sphere});

  @override
  void paint(Canvas canvas, Size size) {
    // Project the sphere's center to the 2D plane
    final centerPoint = Offset(size.width / 2, size.height / 2);

    // Draw the sphere as a circle on the canvas
    final paint = Paint()
      ..color = themeControllerState.theme.primaryColor
      ..style = PaintingStyle.stroke // or PaintingStyle.fill
      ..strokeWidth = 2.0; // Adjust as needed

    canvas.drawCircle(
      centerPoint,
      sphere.radius,
      paint,
    );
  }

  @override
  bool shouldRepaint(SpherePainter oldDelegate) {
    return oldDelegate.sphere != sphere;
  }
}
