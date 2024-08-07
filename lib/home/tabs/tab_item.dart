import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryLightColor, width: 2),
          color: isSelected ? AppColors.primaryLightColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isSelected
                ? AppColors.whiteColor
                : AppColors.primaryLightColor),
      ),
    );
  }
}
