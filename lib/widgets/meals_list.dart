import 'package:flutter/material.dart';

class MealsList extends StatelessWidget {
  MealsList({super.key});
  // TODO: Create a list of meal categories
  final _categories = [];

  @override
  Widget build(BuildContext context) {
    final mealCategoryDivider = Divider(height: 0, indent: 10, endIndent: 20);
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
