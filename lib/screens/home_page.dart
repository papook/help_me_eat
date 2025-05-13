import 'package:flutter/material.dart';
import 'package:help_me_eat/widgets/calorie_progress_bar.dart';
import 'package:help_me_eat/widgets/meal_types_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Implement the rest of the home page
    return SingleChildScrollView(
      child: Column(children: [CalorieProgressBar(), MealTypesListView()]),
    );
  }
}
