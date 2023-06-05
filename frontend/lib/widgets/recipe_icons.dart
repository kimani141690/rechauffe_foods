import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class RecipeIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  double? number;
  RecipeIcons({super.key, required this.icon, required this.text, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      width: 71,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), color: AppColors.mainColor),
      child: Center(
        child: Column(children: [
          Container(
            height: 44,
            width: 44,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
              text: number.toString(),
              fontWeight: FontWeight.w600,
              fontSize: 16,
              textColor: Colors.white),
          CustomText(
              text: text,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              textColor: Colors.white),
        ]),
      ),
    );
  }
}
