import 'package:flutter/material.dart';

import 'package:spaceword/constants/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color bgColor;

  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.bgColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: const Size(200, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(
            color: customButtonBorderColor,
            width: 7.0,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'FontdinerSwanky',
          color: color,
          fontSize: 24,
        ),
      ),
    );
  }
}
