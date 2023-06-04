import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class NutrientsButtons extends StatelessWidget {
  final String measurements;
  final String name;
  const NutrientsButtons(
      {super.key, required this.measurements, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(bottom: 10, left: 15),
      decoration: BoxDecoration(
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
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomText(
              text: '$measurements g',
              fontWeight: FontWeight.normal,
              fontSize: 13,
              textColor: AppColors.greyTextColor),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            text: name,
            fontWeight: FontWeight.w900,
            fontSize: 10,
            textColor: AppColors.mainColor,
          )
        ]),
      ),
    );
  }
}
