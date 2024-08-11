import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';

class Category {
  String id;

  String title;

  String imagePath;

  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/sports.png',
          color: AppColors.redColor),
      Category(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/general.png',
          color: AppColors.darkBlueColor),
      Category(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: AppColors.pinkColor),
      Category(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: AppColors.brownColor),
      Category(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/entertainment.png',
          color: AppColors.blueColor),
      Category(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: AppColors.yellowColor),
      Category(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/technology.png',
          color: AppColors.darkBlueColor),
    ];
  }
}
