import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onDrawerItemTapped});

  final void Function(String identifier) onDrawerItemTapped;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cooking Up!',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ).copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onDrawerItemTapped('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ).copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onDrawerItemTapped('filters');
            },
          ),
        ],
      ),
    );
  }
}
