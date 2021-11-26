import 'package:flutter/material.dart';

class LocationPointView extends StatefulWidget {
  bool isFocus;
  double top, left, radius;

  LocationPointView({
    required this.top,
    required this.left,
    this.radius = 35,
    this.isFocus = false,
  });

  @override
  _LocationPointViewState createState() => _LocationPointViewState();
}

class _LocationPointViewState extends State<LocationPointView> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.top,
        left: widget.left,
        width: widget.radius,
        height: widget.radius,
        child: CustomPaint(
          painter: LocationPointCustomPainter(widget.isFocus),
        ));
  }
}

class LocationPointCustomPainter extends CustomPainter {
  final bool isFocus;
  LocationPointCustomPainter(this.isFocus);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    Paint bigCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0XFF115056).withOpacity(0.25);
    canvas.drawCircle(Offset(centerX, centerY), size.width, bigCirclePaint);

    Paint centerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0XFF115056);
    canvas.drawCircle(Offset(centerX, centerY), 5, centerCirclePaint);

    if (isFocus) {
      Paint strokeBigCirclePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = const Color(0XFFF5A832).withOpacity(0.25);
      canvas.drawCircle(
          Offset(centerX, centerY), size.width, strokeBigCirclePaint);

      Paint strokeCenterCirclePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..color = const Color(0XFFF5A832).withOpacity(0.25);
      canvas.drawCircle(Offset(centerX, centerY), 5, strokeCenterCirclePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
