import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const TextTitle({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 42.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0,
        fontSize: fontSize,
        decoration: TextDecoration.none,
      ),
    );
  }
}

class TextMedium extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Widget? child;
  final FontWeight fontWeight;

  const TextMedium(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 18.0,
      this.child,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: color,
          letterSpacing: 0,
          fontSize: fontSize,
          decoration: TextDecoration.none,
          fontWeight: fontWeight),
    );
  }
}

class TextSmall extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final Widget? child;
  final FontWeight fontWeight;

  const TextSmall({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.w500,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        color: color,
        letterSpacing: 0,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
