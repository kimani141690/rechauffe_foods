import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/check_recipe_btn.dart';
import 'package:frontend/widgets/custon_text.dart';
import 'package:frontend/widgets/icon_buttons.dart';
import 'package:frontend/widgets/nutrients_buttons.dart';
import 'package:frontend/widgets/stack_recipe_detail.dart';

class RecipeDetails extends StatefulWidget {
  const RecipeDetails({super.key});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  List<String> name = ["Carbs", "Proteins", "Fats", "Sugars"];
  List<int> digits = [101, 24, 12, 21];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 480,
            width: 420,
            child: const StackRecipeDetail(imageURL: "assets/fullfood (1).jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: CustomText(
              text: "Rice, eggs & veggetables",
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
                  text:
                      "They improved dramatically once the lead singer left.He walked into the basement with the horror movie from the night before playing in his head.She found it strange that ",
                  textColor: AppColors.greyTextColor,
                  lineheight: 1.5,
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 60,
                  width: double.maxFinite,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 32,
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
  }
}
