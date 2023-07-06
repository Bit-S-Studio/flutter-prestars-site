import 'package:flutter/material.dart';

class UiDotPage extends StatelessWidget {

  final Color color;

  const UiDotPage({ Key? key, required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 4,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}