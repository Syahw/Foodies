import 'package:flutter/material.dart';

class MyBottomContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadiusAll;
  final Color color;
  final Widget? child;
  final EdgeInsets padding;

  const MyBottomContainer({
    Key? key,
    this.height = 150,
    this.width = 450,
    this.borderRadiusAll = 2,
    this.color = Colors.white,
    this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}

class MyContainer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadiusAll;
  final Widget? borderRadius;
  final Color color;
  final Widget? child;
  final EdgeInsets padding;

  const MyContainer({
    Key? key,
    this.height = 150,
    this.borderRadius,
    this.width = 450,
    this.borderRadiusAll = 2,
    this.color = Colors.white,
    this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: child,
    );
  }
}
