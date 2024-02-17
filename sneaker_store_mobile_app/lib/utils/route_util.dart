import 'package:flutter/material.dart';

class RouteUtil {
  static Route routeSlideTransition(Widget destinationPage, bool slideRight) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => destinationPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        Offset begin = slideRight ? Offset(1.0, 0.0) : Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        print("page slide called");
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}