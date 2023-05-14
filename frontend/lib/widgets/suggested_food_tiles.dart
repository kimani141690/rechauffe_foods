import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestedFoodTiles extends StatelessWidget {
  final String imgURL;
  final String foodName;
  final String foodCategory;
  final int servings;
  final int calories;
  const SuggestedFoodTiles(
      {super.key,
      required this.calories,
      required this.foodCategory,
      required this.foodName,
      required this.imgURL,
      required this.servings});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305,
      width: 355,
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
      child: Column(
        children: [
          Container(
            height: 163.47,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.greyTextColor,
              image: DecorationImage(
                image: AssetImage(
                  imgURL,
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foodName,
                  style: GoogleFonts.breeSerif(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  text: foodCategory,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                  textColor: AppColors.greyTextColor,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$servings servings",
                      style: GoogleFonts.breeSerif(
                          fontSize: 16, color: AppColors.mainColor),
                    ),
                    CustomText(
                        text: "Calories - $calories g",
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
