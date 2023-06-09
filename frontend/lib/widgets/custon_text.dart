import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  double lineheight;

  CustomText({
    super.key,
    required this.text,
    this.textColor = const Color(0xFF000000),
    required this.fontWeight,
    required this.fontSize,
    this.lineheight = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineheight,
      ),
    );
  }
}
