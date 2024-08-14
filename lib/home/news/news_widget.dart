import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';
import 'package:flutter_app_news_c11_sun/home/news/news_item.dart';
import 'package:flutter_app_news_c11_sun/home/news/news_widget_view_model.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
            child: Text('Top Header'),
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                return Column(
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNewsBySourceId(widget.source.id ?? '');
                        },
                        child: Text('Try Again'))
                  ],
                );
              } else if (viewModel.newsList == null) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        child!,
                        NewsItem(news: viewModel.newsList![index]),
                      ],
                    );
                  },
                  itemCount: viewModel.newsList!.length,
                );
              }
            })
        // FutureBuilder<NewsResponse?>(
        //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return Center(
        //           child: CircularProgressIndicator(
        //             color: AppColors.primaryLightColor,
        //           ),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Column(
        //           children: [
        //             Text('Something went wrong'),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.source.id ?? '');
        //                   setState(() {});
        //                 },
        //                 child: Text('Try Again'))
        //           ],
        //         );
        //       }
        //
        //       /// server => success , error
        //       if (snapshot.data!.status != 'ok') {
        //         return Column(
        //           children: [
        //             Text(snapshot.data!.message!),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.source.id ?? '');
        //                 },
        //                 child: Text('Try Again'))
        //           ],
        //         );
        //       }
        //       var newsList = snapshot.data!.articles!;
        //       return ListView.builder(
        //         itemBuilder: (context, index) {
        //           return NewsItem(news: newsList[index]);
        //         },
        //         itemCount: newsList.length,
        //       );
        //     }),
        );
  }
}
