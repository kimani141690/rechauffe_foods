import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class BalancedDietWidget extends StatelessWidget {
  final String imageURL;
  const BalancedDietWidget({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          height: 150,
          width: 390,
        ),
        Positioned(
          top: 10,
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            height: 116,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    0.0,
                    4.0,
                  ),
                  blurRadius: 6.0,
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
          ),
        ),
        Positioned(
          left: 240,
          bottom: 0,
          child: Image.asset(
            imageURL,
            width: 175,
          ),
        ),
        Positioned(
          top: 30,
          left: 20,
          child: Container(
            width: 220,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Balanced Diet',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  textColor: AppColors.mainColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: 'Stay healthy and young by eating a balanced diet',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
