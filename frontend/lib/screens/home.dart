import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/balanced_diet_widget.dart';
import 'package:frontend/widgets/bottom_nav.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/home_food_tiles.dart';
import 'package:frontend/widgets/icon_buttons.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  List<String> foodURL = [
    "assets/food3.png",
    "assets/food2.png",
    "assets/food1.png",
    "assets/food4.png"
  ];
  List<String> titles = [
    "Rice , eggs & vegetables",
    "Baco,eggs & vegetables",
    "Healthy salad",
    "Shrimp , kales & pepper foodies",
  ];

  List<Color> iconColors = [
    AppColors.mainColor,
    Colors.white,
    AppColors.mainColor,
    AppColors.mainColor,
  ];

  @override
  Widget build(BuildContext context) {
    final CollectionReference _recipes =
        FirebaseFirestore.instance.collection('Recipes');

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15, top: 35),
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
              textColor: AppColors.mainColor,
            ),
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
              height: 60,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
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
            SizedBox(
              height: 30,
            ),
            StreamBuilder(
                stream: _recipes.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: 16,
                      ),
                      height: 315,
                      width: double.infinity,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 15,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          final List<DocumentSnapshot> shuffledDocs =
                              List.from(streamSnapshot.data!.docs);
                          shuffledDocs.shuffle(Random());

                          final DocumentSnapshot documentSnapshot =
                              shuffledDocs[index];
                          String modifiedImageURL = documentSnapshot['Images'];

                          if (modifiedImageURL.startsWith('"') &&
                              modifiedImageURL.endsWith('"')) {
                            // Remove the first and last character (quotation marks)
                            modifiedImageURL = modifiedImageURL.substring(
                                1, modifiedImageURL.length - 1);
                          }
                          return HomeFoodTiles(
                            calories: documentSnapshot['Calories'].toString(),
                            imageURL: modifiedImageURL,
                            title: documentSnapshot['Name'],
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  } else {
                    // Handle the case when there is no data available
                    return CircularProgressIndicator(); // or any other widget you want to display
                  }
                }),
            SizedBox(
              height: 25,
            ),
            BalancedDietWidget(imageURL: 'assets/food4.png')
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: MyBottomNav(),
      ),
    );
  }
}
