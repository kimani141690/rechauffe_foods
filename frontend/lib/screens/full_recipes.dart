import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/bottom_nav.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/point_form_widget.dart';
import 'package:frontend/widgets/ratings_button.dart';
import 'package:frontend/widgets/recipe_icons.dart';
import '../../utils/dimensions.dart';

class FullRecipes extends StatefulWidget {
  final String id;
  const FullRecipes({super.key, required this.id});

  @override
  State<FullRecipes> createState() => _FullRecipesState();
}

class _FullRecipesState extends State<FullRecipes> {
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.breakfast_dining,
      Icons.lunch_dining,
      Icons.dinner_dining,
      Icons.cake
    ];
    List<String> text = ["min", "servings", "cal", "Easy"];
    List<double> numbers = [35, 03, 101, 0];
    final CollectionReference _recipes =
        FirebaseFirestore.instance.collection('Recipes');
    return FutureBuilder<DocumentSnapshot>(
      future: _recipes.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: CustomText(
                text: "Something went wrong:(",
                fontWeight: FontWeight.w400,
                fontSize: 20),
          );
        }
        if (snapshot.hasData) {
          final data = snapshot.data!.data() as Map<String, dynamic>;
          String modifiedImageURL = data['Images'];

          if (modifiedImageURL.startsWith('"') &&
              modifiedImageURL.endsWith('"')) {
            // Remove the first and last character (quotation marks)
            modifiedImageURL =
                modifiedImageURL.substring(1, modifiedImageURL.length - 1);
          }
          String ingredientsString = data["RecipeIngredientParts"];
          ingredientsString =
              ingredientsString.substring(2, ingredientsString.length - 2);

          // Split by commas and trim whitespace
          List<String> ingredients = ingredientsString
              .split(',')
              .map((ingredient) => ingredient.trim().replaceAll('"', ''))
              .toList();

          String directionsString = data["RecipeInstructions"];

          String content =
              directionsString.substring(2, directionsString.length - 2);

// Split by commas outside quotation marks
          List<String> directions = content
              .split(RegExp(r',(?=(?:[^"]*"[^"]*")*[^"]*$)'))
              .map((instruction) => instruction.trim().replaceAll('"', ''))
              .toList();

          return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 70,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(icon: Icons.arrow_back_ios),
                      AppIcon(icon: Icons.favorite_border_sharp)
                    ],
                  ),
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: Container(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 10, left: 20, right: 20),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 180,
                                child: CustomText(
                                    text: data["Name"],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    textColor: AppColors.mainColor),
                              ),
                              RatingsButton(
                                onTap: () {},
                                label: data["AggregatedRating"],
                              ),
                            ],
                          ))),
                  backgroundColor: AppColors.mainColor,
                  pinned: true,
                  expandedHeight: 300,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      modifiedImageURL,
                      width: double.maxFinite, //takes the max width
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 105,
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 28,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: icons.length,
                          itemBuilder: (context, index) {
                            return RecipeIcons(
                              icon: icons[index],
                              text: text[index],
                              number: numbers[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Ingredients",
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: ingredients
                                  .map((ingredient) =>
                                      PointFormWidget(text: ingredient))
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomText(
                              text: "Directions",
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: directions
                                  .map((direction) =>
                                      PointFormWidget(text: direction))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const MyBottomNav(),
          );
        } else {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
            )),
          );
        }
      },
    );
  }
}
