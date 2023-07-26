import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteTransition extends CustomTransitionPage {
  RouteTransition(
      {required LocalKey key,
      required Widget child,
      bool isTopToBottom = false})
      : super(
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: isTopToBottom
                      ? const Offset(0.0, 1.0)
                      : const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child);
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}
