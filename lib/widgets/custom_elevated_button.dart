import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double horizontal;
  final double vertical;
  final double circular;
  final dynamic color;
  final String title;
  final double fontSize;
final  Function()? onPressed;
   const CustomElevatedButton({
    super.key,
    required this.horizontal,
    required this.vertical,
    required this.circular,
    required this.color,
    required this.title,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular)))),
      child: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
