import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() =>
      _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFreeFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _glutenFreeFilterSet = newValue;
                });
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
              activeColor: Theme.of(
                context,
              ).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _lactoseFreeFilterSet = newValue;
                });
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
              activeColor: Theme.of(
                context,
              ).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _vegetarianFreeFilterSet = newValue;
                });
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
              activeColor: Theme.of(
                context,
              ).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _veganFreeFilterSet,
              onChanged: (newValue) {
                setState(() {
                  _veganFreeFilterSet = newValue;
                });
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
              activeColor: Theme.of(
                context,
              ).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
