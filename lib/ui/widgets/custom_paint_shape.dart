// class BNBCustomPainter extends CustomPainter {
//   final BuildContext context;
//   BNBCustomPainter({this.context});
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = new Paint()
//       ..color = Theme.of(context).primaryColor.withOpacity(0.8)
//       ..style = PaintingStyle.fill;
//
//     Path path = Path();
//     path.moveTo(0, 0); // Start
//     path.quadraticBezierTo(0, 0, size.width * 0.35, 0);
//     path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
//     path.arcToPoint(Offset(size.width * 0.60, 20),
//         radius: Radius.circular(20.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.lineTo(0, 20);
//     canvas.drawShadow(path, Colors.black, 5, true);
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
import 'package:flutter/material.dart';

class BNBCustomPainter extends CustomPainter {
  final BuildContext context;
  BNBCustomPainter({this.context});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Theme.of(context).backgroundColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, size.height * 0.2450000);
    path_0.quadraticBezierTo(size.width * 0.0015625, size.height * 0.0012500,
        size.width * 0.0637500, 0);
    path_0.quadraticBezierTo(
        size.width * 0.1250000, 0, size.width * 0.3087500, 0);
    path_0.quadraticBezierTo(size.width * 0.3631250, size.height * 0.0575000,
        size.width * 0.3762500, size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.4056250,
        size.height * 0.8937500,
        size.width * 0.5959375,
        size.height * 0.9250000,
        size.width * 0.6237500,
        size.height * 0.2450000);
    path_0.quadraticBezierTo(size.width * 0.6403125, size.height * 0.0325000,
        size.width * 0.6887500, 0);
    path_0.quadraticBezierTo(
        size.width * 0.8753125, 0, size.width * 0.9375000, 0);
    path_0.quadraticBezierTo(size.width * 0.9993750, size.height * 0.0012500,
        size.width, size.height * 0.2650000);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
