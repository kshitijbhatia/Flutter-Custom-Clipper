import 'package:flutter/material.dart';

class CustomClipper2 extends StatelessWidget {
  const CustomClipper2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
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
    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.arcToPoint(Offset(size.width, radius));
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius));
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: false);
    path.lineTo(0, radius);
    path.arcToPoint(Offset(radius, 0), radius: const Radius.elliptical(40, 20));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}