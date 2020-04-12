import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function setFilter;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.setFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegetarian = widget.filters['vegetarian'];
    _isVegan = widget.filters['vegan'];
  }

  Widget buildSwithListTile(
      {String title, String subtitle, bool value, Function update}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwithListTile(
                    title: 'Gluten-free',
                    subtitle: 'Only include gluten-free meals',
                    value: _isGlutenFree,
                    update: (value) {
                      setState(() {
                        _isGlutenFree = value;
                      });
                    }),
                buildSwithListTile(
                    title: 'Lactose-free',
                    subtitle: 'Only include lactose-free meals',
                    value: _isLactoseFree,
                    update: (value) {
                      setState(() {
                        _isLactoseFree = value;
                      });
                    }),
                buildSwithListTile(
                    title: 'Vegeterian',
                    subtitle: 'Only include vegetarian meals',
                    value: _isVegetarian,
                    update: (value) {
                      setState(() {
                        _isVegetarian = value;
                      });
                    }),
                buildSwithListTile(
                    title: 'Vegan',
                    subtitle: 'Only include vegan meals',
                    value: _isVegan,
                    update: (value) {
                      setState(() {
                        _isVegan = value;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => widget.setFilter({
          'gluten': _isGlutenFree,
          'lactose': _isLactoseFree,
          'vegetarian': _isVegetarian,
          'vegan': _isVegan,
        }),
      ),
    );
  }
}
