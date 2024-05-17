import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.filters,
    required this.saveFilters,
  });

  static const routeName = '/filters';
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> filters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool glutenFree;
  late bool vegetarian;
  late bool vegan;
  late bool lactoseFree;

  @override
  void initState() {
    glutenFree = widget.filters['gluten'] ?? false;
    vegetarian = widget.filters['vegetarian'] ?? false;
    vegan = widget.filters['vegan'] ?? false;
    lactoseFree = widget.filters['lactose'] ?? false;
    super.initState();
  }

  Widget buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    void Function(bool) update,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: update,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.done),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meals!',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten Free',
                  'Only include Gluten free meals',
                  glutenFree,
                  (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  'Only include Lactose free meals',
                  lactoseFree,
                  (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  vegetarian,
                  (newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  vegan,
                  (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
