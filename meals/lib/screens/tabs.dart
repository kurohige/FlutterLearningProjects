import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeScreenTitle =
        _selectedPageIndex == 0 ? 'Categories' : 'Favorites';

    Widget activeScreen = _selectedPageIndex == 0
        ? const CategoriesScreen()
        : const MealsScreen(
            meals: [],
          );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
        ),
        body: activeScreen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _selectPage(value),
          currentIndex: _selectedPageIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
