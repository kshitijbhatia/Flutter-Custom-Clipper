import 'package:flutter/material.dart';

class CustomClipper1 extends StatelessWidget {
  const CustomClipper1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: _MyCustomClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.2,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width/2, 0);
    path.lineTo(0, size.height);
    path.cubicTo(size.width/2.5 - 40, size.height/1.3, size.width/1.25, size.height, size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}