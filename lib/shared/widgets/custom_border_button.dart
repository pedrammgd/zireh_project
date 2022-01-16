import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zireh_project/core/constans/constans.dart';

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {this.titleButton = 'دکمه',
      required this.onPressed,
      this.backgroundColor,
      this.isFilled = false});

  final String titleButton;
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        titleButton,
        style: TextStyle(
            color: isFilled ? Colors.white : pinkColor,
            fontWeight: FontWeight.bold),
      ),
      style: OutlinedButton.styleFrom(
        primary: pinkColor,
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: BorderSide(
          width: 1.5,
          color: pinkColor,
        ),
      ),
    );
  }
}
