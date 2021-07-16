import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key, this.filterFunction, this.currentFilters})
      : super(key: key);
  static const routeName = '/filters';
  final Function filterFunction;
  final Map<String, bool> currentFilters;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  initState() {
    isGlutenFree = widget.currentFilters['gluten'];
    isVegan = widget.currentFilters['vegan'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  buildListTile(
      String title, String subtitle, bool switchValue, Function function) {
    return SwitchListTile(
      title: Text(title),
      value: switchValue,
      subtitle: Text(subtitle),
      onChanged: function,
    );
  }

  bool isGlutenFree = false;
  bool isVegan = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> filers = {
                'lactose': isLactoseFree,
                'gluten': isGlutenFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian
              };
              widget.filterFunction(filers);
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildListTile("Gluten Free", 'Only include gluten free meal',
                    isGlutenFree, (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                buildListTile('Vegan', 'Only include vegan meal', isVegan,
                    (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
                buildListTile('Lactose free', 'Only include Lactose free meal',
                    isLactoseFree, (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                }),
                buildListTile(
                    'Vegetarian', 'Only include vegetarian', isVegetarian,
                    (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
