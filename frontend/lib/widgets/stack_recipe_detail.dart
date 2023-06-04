import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class StackRecipeDetail extends StatelessWidget {
  final String imageURL;
  const StackRecipeDetail({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        child: Container(
          height: 250,
          width: 413,
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(130),
              bottomRight: Radius.circular(130),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: FractionallySizedBox(
            widthFactor:
                0.8, // Adjust this value as needed to control the width of the container
            child: Container(
              height: 330,
              width: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(170),
                color: AppColors.greyTextColor,
                image: DecorationImage(
                  image: NetworkImage(
                    imageURL,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
