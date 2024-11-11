import 'package:flutter/material.dart';

class MyRoundedCard extends StatelessWidget {
  final double height;
  final double width;
  final double elevation;
  final Color color;
  final Widget? child;
  final ShapeBorder? shape;

  const MyRoundedCard({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.shape,
    this.color = Colors.white,
    this.elevation = 3,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  final double height;
  final double width;
  final double elevation;
  final Color color;
  final Widget? child;
  final ShapeBorder? shape;

  const MyCard({
    Key? key,
    this.height = 100,
    this.width = 100,
    this.shape,
    this.color = Colors.white,
    this.elevation = 3,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
