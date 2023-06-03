import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;

  const MyIconButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              4.0,
            ),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
    );
  }
}
