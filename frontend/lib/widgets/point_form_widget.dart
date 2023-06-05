import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';

class PointFormWidget extends StatelessWidget {
  final String text;
  const PointFormWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7, left: 20),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Wrap(
            children: [
              SizedBox(
                width: 300,
                child: CustomText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  textColor: AppColors.greyTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
