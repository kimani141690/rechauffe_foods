import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class LeftoverStorageChips extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  const LeftoverStorageChips({
    super.key,
    required this.onTap,
    required this.label,
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xFF5A9F83),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
