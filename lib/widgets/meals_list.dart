import 'package:flutter/material.dart';

class MealsList extends StatelessWidget {
  MealsList({super.key});
  // TODO: Create a list of meal categories
  final _categories = [
    MealCategoryTile(mealCategory: MealCategory.breakfast),
    MealCategoryTile(mealCategory: MealCategory.lunch),
    MealCategoryTile(mealCategory: MealCategory.dinner),
    MealCategoryTile(mealCategory: MealCategory.snacks),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 0),
        child: SingleChildScrollView(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              return _categories[index];
            },
            separatorBuilder: (context, index) {
              return Divider(indent: 10, endIndent: 20);
            },
          ),
        ),
      ),
    );
  }
}

class MealCategoryTile extends StatelessWidget {
  final MealCategory mealCategory;
  // TODO: Replace both values with actual data from the provider
  final double intakeCals = 200;
  final double goalCals = 500;

  const MealCategoryTile({super.key, required this.mealCategory});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        margin: const EdgeInsets.only(right: 5),
        child: mealCategory.iconWidget,
      ),
      title: Text(
        mealCategory.mealName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${intakeCals.round()} / ${goalCals.round()} kcal',
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      trailing: IconButton(
        // TODO: Implement the method to add a meal
        onPressed: () {},
        icon: const Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}

enum MealCategory {
  breakfast(
    mealName: 'Breakfast',
    iconWidget: Icon(Icons.breakfast_dining, size: _iconSize),
  ),
  lunch(
    mealName: 'Lunch',
    iconWidget: Icon(Icons.lunch_dining, size: _iconSize),
  ),
  dinner(
    mealName: 'Dinner',
    iconWidget: Icon(Icons.dinner_dining, size: _iconSize),
  ),
  snacks(
    mealName: 'Snacks',
    iconWidget: Icon(Icons.local_drink, size: _iconSize),
  );

  static const double _iconSize = 30.0;
  final String mealName;
  final Icon iconWidget;

  const MealCategory({required this.mealName, required this.iconWidget});
}
