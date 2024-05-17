import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/category/category_detials.dart';
import 'package:news/category/category_grid.dart';
import 'package:news/category/category_model.dart';
import 'package:news/category/news_search.dart';
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
        drawer: HomeDrawer(
          onDrawerItemSelected,
          onsideMenuItem: (int newSelectedMenuItem) {},
        ),
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  showSearch(
                    context: context,
                    delegate: NewsSearch(),
                  );
                });
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    selectedDrawerItem == DrawerItem.settings
                        ? 'Settings'
                        : selectedCategory != null
                            ? selectedCategory!.title
                            : 'News App',
                  ),
                ],
              ),
            ],
          ),
        ),
        body: _buildBody(),
        // selectedCategory != null
        //     ? CategoryDetials(selectedCategory!.id, category: null,)
        //     : selectedDrawerItem == DrawerItem.settings
        //         ? const SettingsTab()
        //         : CategoryGrid(onCategorySelected: onCategorySelected),
      ),
    );
  }

  var selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

  void onDrawerItemSelected(DrawerItem selectedItem) {
    if (selectedItem == DrawerItem.categories) {
      selectedCategory = null;
    } else if (selectedItem == DrawerItem.settings) {
      selectedCategory = null;
      selectedDrawerItem = DrawerItem.settings;
    }
    setState(() {});
    Navigator.of(context).pop();
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  Widget _buildBody() {
    if (selectedDrawerItem == DrawerItem.settings) {
      return const SettingsTab();
    } else if (selectedCategory != null) {
      return CategoryDetials(selectedCategory!.id, category: null);
    } else {
      return CategoryGrid(onCategorySelected: onCategorySelected);
    }
  }
}
