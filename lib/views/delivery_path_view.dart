import 'package:flutter/material.dart';

class DeliveryPathView extends StatefulWidget {
  final int placesCount, currentPlace;
  final Size size;

  DeliveryPathView({
    required this.placesCount,
    required this.currentPlace,
    required this.size,
  });

  @override
  _DeliveryPathViewState createState() => _DeliveryPathViewState();
}

class _DeliveryPathViewState extends State<DeliveryPathView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: widget.size,
      painter: DeliveryPathCustomPanter(
        placesCount: widget.placesCount,
        currentPlace: widget.currentPlace,
      ),
    );
  }
}

class DeliveryPathCustomPanter extends CustomPainter {
  final int placesCount, currentPlace;
  DeliveryPathCustomPanter(
      {required this.placesCount, required this.currentPlace});

  void drawCircle(
      Canvas canvas, double centerX, double centerY, double radius) {
    Paint bigCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawCircle(
        Offset(centerX, centerY - radius * 0.3), radius * 0.7, bigCirclePaint);

    Paint strokeCirclePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0XFFF5A832);
    canvas.drawCircle(Offset(centerX, centerY - radius * 0.3), radius * 0.7,
        strokeCirclePaint);

    Paint centerCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0XFF115056);
    canvas.drawCircle(Offset(centerX, centerY - radius * 0.3), radius * 0.3,
        centerCirclePaint);
  }

  void drawPlaceCircle(
      Canvas canvas, double centerX, double centerY, double radius) {
    Paint bigCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    canvas.drawCircle(
        Offset(centerX, centerY - radius * 0.3), radius * 0.7, bigCirclePaint);

    Paint strokeCirclePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0XFFF5A832);
    canvas.drawCircle(Offset(centerX, centerY - radius * 0.3), radius * 0.7,
        strokeCirclePaint);

    IconData icon = Icons.location_on;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: radius * 0.9,
          fontFamily: icon.fontFamily,
          color: const Color(0XFF115056),
        ));
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(centerX - (radius * 0.45),
            centerY - (radius * 0.45) - radius * 0.3));
  }

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double itemSize = size.height / placesCount;
    double radius = (itemSize / 2);
    radius = radius <= 25 ? radius : 25;

    Offset pathStart = Offset(centerX, (itemSize * 1) - radius);
    Offset pathEnd = Offset(centerX, (itemSize * placesCount) - radius);

    Paint pathPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius * 0.35
      ..color = const Color(0XFF115056);
    canvas.drawLine(pathStart, pathEnd, pathPaint);

    int index = 1;
    while (index <= placesCount) {
      index == 1 || index == placesCount
          ? drawCircle(
              canvas,
              centerX,
              (itemSize * index) - radius,
              radius,
            )
          : drawPlaceCircle(
              canvas,
              centerX,
              (itemSize * index) - radius,
              radius,
            );
      ++index;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
