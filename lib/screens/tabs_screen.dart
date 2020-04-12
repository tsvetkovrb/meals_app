import 'package:flutter/material.dart';
import 'package:shop_app/models/meal.dart';
import 'package:shop_app/screens/categories_screen.dart';
import 'package:shop_app/screens/favorite_screen.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _screens;

  int _selectedScreenIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Categories',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Favorite',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedScreenIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            title: Text('Meals'),
            icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text('Favorite'),
            icon: Icon(Icons.favorite),
          )
        ],
      ),
    );
  }
}
