import 'package:flutter/material.dart';
import 'package:frontend/widgets/custon_text.dart';

import '../utils/colors.dart';

class CheckRecipeButton extends StatelessWidget {
  final VoidCallback onTap;
  const CheckRecipeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: CustomText(
            text: 'CHECK THE RECIPE',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
