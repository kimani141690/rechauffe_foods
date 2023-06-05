import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/check_recipe_btn.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/nutrients_buttons.dart';
import 'package:frontend/widgets/stack_recipe_detail.dart';

class RecipeDetails extends StatefulWidget {
  final String id;

  const RecipeDetails({super.key, required this.id});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  List<String> name = [
    "Calories",
    "Carbs",
    "Proteins",
    "Fats",
    "Sugars",
    "Choles",
    "Fibre",
    "Sodium"
  ];

  @override
  Widget build(BuildContext context) {
    final CollectionReference _recipes =
        FirebaseFirestore.instance.collection('Recipes');
    return FutureBuilder<DocumentSnapshot>(
      future: _recipes.doc(widget.id).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
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
          final num calories = data['Calories'] is int
              ? data['Calories']
              : data['Calories'].toDouble();
          final num carbs = data['CarbohydrateContent'] is int
              ? data['CarbohydrateContent']
              : data['CarbohydrateContent'].toDouble();
          final num prots = data['ProteinContent'] is int
              ? data['ProteinContent']
              : data['ProteinContent'].toDouble();
          final num fats = data['FatContent'] is int
              ? data['FatContent']
              : data['FatContent'].toDouble();
          final num sugar = data['SugarContent'] is int
              ? data['SugarContent']
              : data['SugarContent'].toDouble();
          final num choles = data['CholesterolContent'] is int
              ? data['CholesterolContent']
              : data['CholesterolContent'].toDouble();
          final num fiber = data['FiberContent'] is int
              ? data['FiberContent']
              : data['FiberContent'].toDouble();
          final num sodium = data['SodiumContent'] is int
              ? data['SodiumContent']
              : data['SodiumContent'].toDouble();

          List<num> digits = [
            calories,
            carbs,
            sugar,
            choles,
            fiber,
            prots,
            fats,
            sodium
          ];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.mainColor, // Set the background color
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 400,
                      width: 420,
                      child: StackRecipeDetail(
                        imageURL: modifiedImageURL,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomText(
                        text: data['Name'],
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        textColor: AppColors.mainColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CustomText(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            text: data['Description'],
                            textColor: AppColors.greyTextColor,
                            lineheight: 1.5,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 75,
                            width: double.maxFinite,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                width: 17,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: name.length,
                              itemBuilder: (context, index) {
                                return NutrientsButtons(
                                  measurements: digits[index].toString(),
                                  name: name[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
            bottomNavigationBar: BottomAppBar(
              child: CheckRecipeButton(onTap: () {}),
            ),
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
