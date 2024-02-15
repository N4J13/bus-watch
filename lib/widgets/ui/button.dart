
import 'package:bus_proj/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ButtonVariant { primary, secondary }

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  double width;
  PhosphorIcon? icon;
  ButtonVariant variant;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.variant = ButtonVariant.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: variant == ButtonVariant.primary
              ? Border.all(
                  style: BorderStyle.solid,
                  color: const Color.fromARGB(255, 160, 137, 255),
                  width: 2,
                )
              : Border.all(
                  style: BorderStyle.solid,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 2,
                ),
          boxShadow: variant == ButtonVariant.primary
              ? [
                  const BoxShadow(
                    color: Color.fromARGB(255, 102, 76, 206),
                    blurRadius: 0,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  const BoxShadow(
                    color: Color.fromARGB(51, 0, 10, 31),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ]
              : [
                  const BoxShadow(
                    color: Color.fromARGB(255, 239, 239, 244),
                    blurRadius: 0,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
          gradient: variant == ButtonVariant.primary
              ? LinearGradient(
                  colors: [
                    MyColors.primary,
                    const Color.fromARGB(255, 153, 127, 255)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : null,
          color: variant == ButtonVariant.secondary
              ? const Color.fromARGB(255, 244, 245, 247)
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon as PhosphorIcon,
            SizedBox(
                width: icon != null
                    ? 10.0
                    : 0), // Adjust spacing if icon is present
            Text(
              text,
              style: TextStyle(
                color: variant == ButtonVariant.primary
                    ? Colors.white
                    : Colors.black87,
                shadows: variant == ButtonVariant.primary
                    ? [
                        const Shadow(
                          color: Color.fromARGB(127, 108, 80, 224),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : null,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
