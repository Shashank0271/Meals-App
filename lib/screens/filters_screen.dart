import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function saveFilters;
  Map<String, bool> filters;
  FiltersScreen(this.filters, this.saveFilters, {Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String subtitle, bool currVal,
      Function(bool value) updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      subtitle: Text(subtitle),
      onChanged: updateValue,
      value: currVal,
    );
  }

  @override
  initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("filters"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten Free',
                      'Only include gluten-free meals', _glutenFree, (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  }),
                  _buildSwitchListTile('Lactose Free',
                      'Only include lactose-free meals', _lactoseFree, (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  }),
                  _buildSwitchListTile('Vegetarian',
                      'Only include vegetarian meals', _vegetarian, (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegan', 'Only include vegan meals', _vegan, (value) {
                    setState(() {
                      _vegan = value;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
