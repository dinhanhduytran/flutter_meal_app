import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app_flutter/widgets/filters/filter_item.dart';
import 'package:meal_app_flutter/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterItem(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            onCheckFilterState: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            value: activeFilters[Filter.glutenFree]!,
          ),
          FilterItem(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            onCheckFilterState: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            value: activeFilters[Filter.lactoseFree]!,
          ),
          FilterItem(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            onCheckFilterState: (isChecked) {
              ref
                  .read(filtersNotifierProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            value: activeFilters[Filter.vegan]!,
          ),
          FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              onCheckFilterState: (isChecked) {
                ref
                    .read(filtersNotifierProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              value: activeFilters[Filter.vegetarian]!)
        ],
      ),
    );
  }
}
