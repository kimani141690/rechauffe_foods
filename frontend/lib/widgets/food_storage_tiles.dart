import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class FoodStorageTiles extends StatelessWidget {
  final String imageURL;
  final double temperature;
  final String foodName;

  const FoodStorageTiles({
    super.key,
    required this.imageURL,
    required this.temperature,
    required this.foodName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      width: 359,
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
      child: Row(
        children: [
          Container(
            height: 100,
            width: 81.2,
            decoration: BoxDecoration(
              color: AppColors.greyTextColor,
              image: DecorationImage(
                image: AssetImage(imageURL),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              CustomText(
                  text: foodName, fontWeight: FontWeight.w500, fontSize: 16),
              CustomText(
                text: "$temperature degrees celcius",
                fontWeight: FontWeight.w500,
                fontSize: 16,
                textColor: AppColors.mainColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
