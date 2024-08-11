import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';
import 'package:flutter_app_news_c11_sun/home/category/category_details.dart';
import 'package:flutter_app_news_c11_sun/home/category/category_fragment.dart';
import 'package:flutter_app_news_c11_sun/home/drawer/home_drawer.dart';
import 'package:flutter_app_news_c11_sun/home/settings/settings_tab.dart';
import 'package:flutter_app_news_c11_sun/model/Category.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: AppColors.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedMenuItem == HomeDrawer.settings
                ? 'Settings'
                : selectedCategory == null
                    ? 'News App'
                    : selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
        ),
        body: selectedMenuItem == HomeDrawer.settings
            ? SettingsTab()
            : selectedCategory == null
                ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
                : CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    //todo: newCategory => user select
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    //todo: newSideMenuItem => user select
    selectedMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
