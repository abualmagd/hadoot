import 'package:flutter/material.dart';


class PhotoClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width / 1.5, size.height+10
    );
    Offset endPoint = Offset(size.width, size.height/2);
    Path path=Path()
      ..lineTo(0,220)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }


}


class RightPhotoClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width / 1.5, size.height+5
    );
    Offset endPoint = Offset(size.width, size.height-50);
    Path path=Path()
      ..lineTo(0,size.height-110)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }


}