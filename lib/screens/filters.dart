import 'package:flutter/material.dart';
import 'package:meal_app_flutter/widgets/filters/filter_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegetarianFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegan: _veganFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
          });
        },
        child: Column(
          children: [
            FilterItem(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              onCheckFilterState: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              value: _glutenFreeFilterSet,
            ),
            FilterItem(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              onCheckFilterState: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              value: _lactoseFreeFilterSet,
            ),
            FilterItem(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              onCheckFilterState: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              value: _veganFilterSet,
            ),
            FilterItem(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              onCheckFilterState: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              value: _vegetarianFilterSet,
            ),
          ],
        ),
      ),
    );
  }
}
