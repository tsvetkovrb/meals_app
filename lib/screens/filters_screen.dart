import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('FiltersScreen'),
      ),
    );
  }
}
