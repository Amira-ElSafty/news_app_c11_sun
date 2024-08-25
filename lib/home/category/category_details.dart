import 'package:flutter/material.dart';
import 'package:flutter_app_news_c11_sun/app_colors.dart';
import 'package:flutter_app_news_c11_sun/di/di_impl.dart';
import 'package:flutter_app_news_c11_sun/home/category/cubit/category_details_view_model.dart';
import 'package:flutter_app_news_c11_sun/home/category/cubit/source_states.dart';
import 'package:flutter_app_news_c11_sun/home/tabs/tabs_widget.dart';
import 'package:flutter_app_news_c11_sun/model/Category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel =
      CategoryDetailsViewModel(sourceRepository: injectSourceRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    // viewModel.getSources(widget.category.id);
    return BlocBuilder<CategoryDetailsViewModel, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          } else if (state is SourceSuccessState) {
            return TabsWidget(sourcesList: state.sourcesList);
          }
          return Container();

          /// un reachable
        });

    // FutureBuilder<SourceResponse?>(
    //   future: ApiManager.getSources(widget.category.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: AppColors.primaryLightColor,
    //         ),
    //       );
    //     } else if (snapshot.hasError) {
    //       return Column(
    //         children: [
    //           Text('Something went wrong'),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //                 setState(() {});
    //               },
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //
    //     /// server => success , error
    //     if (snapshot.data!.status != 'ok') {
    //       return Column(
    //         children: [
    //           Text(snapshot.data!.message!),
    //           ElevatedButton(
    //               onPressed: () {
    //                 ApiManager.getSources(widget.category.id);
    //               },
    //               child: Text('Try Again'))
    //         ],
    //       );
    //     }
    //     var sourcesList = snapshot.data!.sources!;
    //     return TabsWidget(sourcesList: sourcesList);
    //   });
  }
}
