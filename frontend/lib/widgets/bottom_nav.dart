import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.home_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.widgets_outlined,
              color: Colors.grey.shade300,
              size: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              color: Colors.grey.shade300,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
