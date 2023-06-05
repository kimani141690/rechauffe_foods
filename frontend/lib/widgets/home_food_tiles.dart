import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class HomeFoodTiles extends StatelessWidget {
  final String imageURL;
  final VoidCallback onTap;
  final String title;
  final String calories;
  const HomeFoodTiles({
    super.key,
    required this.calories,
    required this.imageURL,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16, left: 5),
        height: 282,
        width: 214,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 212,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.greyTextColor,
                    image: DecorationImage(
                      image: NetworkImage(imageURL),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                text: title,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                textColor: AppColors.mainColor,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "$calories Calories",
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    textColor: AppColors.greyTextColor,
                  ),
                  Icon(
                    Icons.arrow_right_sharp,
                    color: AppColors.greyTextColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
