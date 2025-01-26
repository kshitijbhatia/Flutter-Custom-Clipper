import 'dart:developer';

import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5C7285),
      body: Stack(
        children: [
          ClipPath(
            clipper: _MyClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 3*(MediaQuery.of(context).size.height/4) + 100,
              color: const Color(0xFF3B6790),
            ),
          ),
          ClipPath(
            clipper: _MyClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2 + 100,
              color: const Color(0xFF23486A),
            ),
          ),
          ClipPath(
            clipper: _MyClipper(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4 + 100,
              color: const Color(0xFF4C7B8B),
            ),
          ),
        ],
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {

  final double controlPointSize = 50;

  @override
  Path getClip(Size size) {
    log("Size: ${size.width} ${size.height}");

    Path path = Path();
    path.lineTo(0, size.height - controlPointSize);
    path.cubicTo(size.width/4, size.height - 2*controlPointSize, 3*(size.width/4), size.height + controlPointSize, size.width, size.height - controlPointSize);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}