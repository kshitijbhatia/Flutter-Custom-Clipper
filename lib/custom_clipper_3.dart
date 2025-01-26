import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';

class CustomClipper3 extends StatelessWidget {
  const CustomClipper3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 400),
        child: ClipPath(
          clipper: _MyCustomClipper(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path>{
  double radius = 20;

  @override
  Path getClip(Size size) {
    dev.log("Size; ${size.width} ${size.height}");
    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcTo(Rect.fromPoints(Offset(size.width - radius, 0), Offset(size.width, radius)), 1.5*pi, 0.5*pi, false);
    path.lineTo(size.width, size.height - radius);
    path.arcTo(Rect.fromCircle(center: Offset(size.width - radius, size.height - radius), radius: radius), 0, 0.5*pi, false);
    path.lineTo(radius, size.height);
    path.arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height), 0.5*pi, 0.5*pi, false);
    path.lineTo(0, radius);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), 1 * pi, 0.5 * pi, false);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}