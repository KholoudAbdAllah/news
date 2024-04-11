import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  // static const int categoriesIndex = 0;
  // static const int settingsIndex = 1;
  final void Function(DrawerItem) onItemSelected;

  const HomeDrawer(this.onItemSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
            color: AppTheme.primaryColor,
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            alignment: Alignment.center,
            child: Title(
              color: AppTheme.whiteColor,
              child: Text(
                'News App !',
                style: textTheme.bodyLarge,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12),
              color: AppTheme.whiteColor,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      onItemSelected(DrawerItem.categories);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Categories',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onItemSelected(DrawerItem.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Settings',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings;
}
