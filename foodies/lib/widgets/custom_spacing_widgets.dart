import 'package:flutter/material.dart';

class MySpacing extends StatelessWidget {
  final double? height;
  final double? width;

  const MySpacing({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
