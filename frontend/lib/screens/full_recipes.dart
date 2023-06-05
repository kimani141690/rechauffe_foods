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

class FullRecipes extends StatelessWidget {
  const FullRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.breakfast_dining,
      Icons.lunch_dining,
      Icons.dinner_dining,
      Icons.cake
    ];
    List<String> ingredients = ["2 Eggs", "1 Cup Rice", "7 Kale Leaves"];
    List<String> text = ["min", "servings", "cal", "Easy"];
    List<String> directions = [
      "Preheat the oven to 350°F and grease a baking dish with butter.",
      "In a large mixing bowl, combine the flour, sugar, and baking powder.",
      "In a separate bowl, whisk together the eggs, milk, and vanilla extract.",
      "Slowly pour the wet ingredients into the dry ingredients and mix until well combined.",
      "Fold in the chocolate chips and chopped nuts.",
      "Pour the batter into the greased baking dish and smooth the top with a spatula.",
      "Bake in the preheated oven for 25-30 minutes or until a toothpick inserted into the center comes out clean.",
      "Remove from the oven and let it cool for 10 minutes before serving.",
    ];

    List<double> numbers = [35, 03, 101, 0];
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
                              text: 'Rice , eggs & vegetables',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              textColor: AppColors.mainColor),
                        ),
                        RatingsButton(
                          onTap: () {},
                          label: '4.5',
                        ),
                      ],
                    ))),
            backgroundColor: AppColors.mainColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/food1.png",
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
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                            .map(
                                (direction) => PointFormWidget(text: direction))
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
  }
}
