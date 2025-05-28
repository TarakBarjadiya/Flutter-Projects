import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return Column(children: [Text(meals[index].title)]);
      },
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh Oh... Nothing Here...",
              style: Theme.of(context).textTheme.headlineLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              "Try Selecting Different Category",
              style: Theme.of(context).textTheme.bodyLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
