import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double borderRadiusAll;
  final Color color;
  final Widget? child;
  final EdgeInsets padding;
  final VoidCallback? onPressed;

  const MyButton({
    this.onPressed,
    Key? key,
    this.text = 'write your text',
    this.borderRadiusAll = 2,
    this.color = Colors.white,
    this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(const Color.fromARGB(255, 39, 180, 112)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: color,
          letterSpacing: 1,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final String text;
  final double borderRadiusAll;
  final Color color;
  final Widget? child;
  final EdgeInsets padding;
  final VoidCallback? onPressed;
  final Widget icon;
  final double? iconSize;

  const MyIconButton({
    this.onPressed,
    this.icon = const Icon(LucideIcons.accessibility),
    this.iconSize,
    Key? key,
    this.text = 'write your text',
    this.borderRadiusAll = 2,
    this.color = Colors.white,
    this.child,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      icon: icon,
      iconSize: iconSize,
      onPressed: onPressed,
      padding: padding,
      style: ButtonStyle(
        backgroundColor:
            WidgetStatePropertyAll(const Color.fromARGB(0, 39, 180, 112)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
