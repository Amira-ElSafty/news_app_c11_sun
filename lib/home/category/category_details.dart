import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';
import 'package:flutter_app_news_c11_sun/home/tabs/tabs_widget.dart';
import 'package:flutter_app_news_c11_sun/model/Category.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          /// server => success , error
          if (snapshot.data!.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          var sourcesList = snapshot.data!.sources!;
          return TabsWidget(sourcesList: sourcesList);
        });
  }
}
