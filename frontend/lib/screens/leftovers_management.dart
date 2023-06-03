import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/bottom_nav.dart';
import '../widgets/food_storage_tiles.dart';
import '../widgets/leftover_storage_chips.dart';

class LeftoversManagement extends StatelessWidget {
  LeftoversManagement({super.key});

  List<String> chipLabels = ["Fridge", "Freezer", "Pantry"];
  List<Color> backgroundColors = [
    Colors.white,
    AppColors.mainColor,
    Colors.white
  ];
  List<Color> iconColors = [
    AppColors.mainColor,
    Colors.white,
    AppColors.mainColor,
  ];

  List<String> foodURL = [
    "assets/fullfood (3).jpg",
    "assets/fullfood (2).jpg",
    "assets/fullfood (1).jpg",
    "assets/fullfood (4).jpg",
  ];

  List<String> foodNames = [
    "Roasted Chicken",
    "Roasted Lobster",
    "Raw Beef",
    "Roasted Mutton",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(
                text: "Let's Check Food",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                textColor: AppColors.mainColor),
            SizedBox(
              height: 5,
            ),
            CustomText(
              text: "Nutrition & calories",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              textColor: AppColors.mainColor,
            ),
            SizedBox(
              height: 5,
            ),
            CustomText(
              text: "Select the food to see the calories",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              height: 65,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 32,
                ),
                itemCount: chipLabels.length,
                itemBuilder: (context, index) {
                  return LeftoverStorageChips(
                    label: chipLabels[index],
                    onTap: () {},
                    backgroundColor: backgroundColors[index],
                    textColor: iconColors[index],
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              height: 315,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: foodURL.length,
                itemBuilder: (context, index) {
                  return FoodStorageTiles(
                    foodName: foodNames[index],
                    imageURL: foodURL[index],
                    temperature: 20,
                  );
                },
              ),
            ),
            SizedBox(
              height: 25,
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
