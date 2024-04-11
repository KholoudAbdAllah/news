import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_detials.dart';
import 'package:news/category/category_grid.dart';
import 'package:news/category/category_model.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        drawer: HomeDrawer(onDrawerItemSelected),
        appBar: AppBar(
          title: Text(
            selectedCategory != null
                ? selectedCategory!.title
                : selectedDrawerItem == DrawerItem.settings
                    ? 'Settings'
                    : 'News App',
          ),
        ),
        body: selectedCategory != null
            ? CategoryDetials(selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.settings
                ? SettingsTab()
                : CategoryGrid(onCategorySelected: onCategorySelected),
      ),
    );
  }

  var selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem selectedItem) {
    selectedDrawerItem = selectedItem;
    if (selectedItem == DrawerItem.categories) {
      selectedDrawerItem = selectedItem;
      //   print('categories selected');
      // } else {
      //   print('settings selected');
      // }
      selectedCategory = null;
      setState(() {});
      Navigator.of(context).pop();
    }
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
