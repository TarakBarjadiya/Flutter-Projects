import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [
              category.categoryColor.withValues(
                alpha: 0.55,
              ),
              category.categoryColor.withValues(
                alpha: 0.90,
              ),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!
              .copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
