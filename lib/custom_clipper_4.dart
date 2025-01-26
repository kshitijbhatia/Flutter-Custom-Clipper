import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class CustomClipper4 extends StatelessWidget {
  const CustomClipper4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: _MyCustomClipper(),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
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
    Path path1 = Path();
    path1.lineTo(0, size.height);
    path1.lineTo(size.width/2, size.height);
    path1.close();

    Path path2 = Path();
    path2.lineTo(size.width/2, 0);
    path2.lineTo(size.width/2, size.height);
    path2.close();


    path1.addPath(path2, Offset(size.width/2, 0));
    return path1;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}