import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/bottom_nav.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/icon_buttons.dart';

import '../widgets/suggested_food_tiles.dart';

class SuggestedFoods extends StatelessWidget {
  SuggestedFoods({super.key});
  List<IconData> icons = [
    Icons.breakfast_dining,
    Icons.lunch_dining,
    Icons.dinner_dining,
    Icons.cake
  ];
  List<Color> backgroundColors = [
    Colors.white,
    AppColors.mainColor,
    Colors.white,
    Colors.white
  ];

  List<Color> iconColors = [
    AppColors.mainColor,
    Colors.white,
    AppColors.mainColor,
    AppColors.mainColor,
  ];

  List<String> foodURL = [
    "assets/fullfood (3).jpg",
    "assets/fullfood (2).jpg",
    "assets/fullfood (1).jpg",
  ];

  List<String> foodCategories = [
    "Dinner",
    "Lunch",
    "Supper",
  ];

  List<int> calories = [170, 379, 893];
  List<String> foodNames = [
    "Shrimp, Kales and Pepper foodies",
    "Rice , eggs & veggetables",
    "Bacon , eggs & veggetables"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu_rounded),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  CustomText(
                    text: "Gennerated Suggestions",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    textColor: AppColors.mainColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "From to your leftovers",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    textColor: AppColors.mainColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "Get healthy food suggestions",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              height: 60,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 32,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: icons.length,
                itemBuilder: (context, index) {
                  return MyIconButton(
                    icon: icons[index],
                    iconColor: iconColors[index],
                    backgroundColor: backgroundColors[index],
                  );
                },
              ),
            ),
            Center(
              child: Container(
                height: 522,
                width: 375,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: calories.length,
                  itemBuilder: (context, index) {
                    return SuggestedFoodTiles(
                      calories: calories[index],
                      foodCategory: foodCategories[index],
                      foodName: foodNames[index],
                      imgURL: foodURL[index],
                      servings: 3,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: MyBottomNav(),
      ),
    );
  }
}
