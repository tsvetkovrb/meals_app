import 'package:flutter/material.dart';
import 'package:shop_app/helpers/theme/configure_theme.dart';
import 'package:shop_app/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: configureTheme(),
      home: CategoriesScreen(),
    );
  }
}
