import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, newValue);
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free meals.",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, newValue);
            },
            title: Text(
              "Lactose-Free",
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include lactose-free meals.",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, newValue);
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include vegetarian meals.",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (newValue) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newValue);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include vegan meals.",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
