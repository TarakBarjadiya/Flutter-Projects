import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withAlpha(85),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsetsGeometry.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 18),
                Text(
                  "Let me cook 🔥",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meals');
            },
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(
                context,
              ).colorScheme.onSurface,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                    fontSize: 16,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(
                context,
              ).colorScheme.onSurface,
            ),
            title: Text(
              "Filter Meals",
              style: Theme.of(context).textTheme.titleSmall!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
