import 'package:flutter/material.dart';

class CalorieProgressBar extends StatelessWidget {
  const CalorieProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Replace with actual data from the provider
    // This is just a placeholder for demonstration purposes!!!!
    final int calorieIntake = 1670;
    final int calorieGoal = 2000;
    final int proteinIntake = 145;
    final int carbsIntake = 265;
    final int fatIntake = 62;

    double progress = calorieIntake / calorieGoal;
    if (progress > 1.0) progress = 1.0; // Cap at 100%

    return Card(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  '$calorieIntake / $calorieGoal kcal',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.antiAlias,
                child: Center(
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 20,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: MacronutrientInfo(
                      data: "Protein",
                      amount: proteinIntake,
                    ),
                  ),
                  Expanded(
                    child: MacronutrientInfo(
                      data: "Carbs",
                      amount: carbsIntake,
                    ),
                  ),
                  Expanded(
                    child: MacronutrientInfo(data: "Fat", amount: fatIntake),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MacronutrientInfo extends StatelessWidget {
  const MacronutrientInfo({
    super.key,
    required this.amount,
    required this.data,
  });

  final int amount;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          amount > 999 ? ">999 g" : '$amount g', // Cap at 999g
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
