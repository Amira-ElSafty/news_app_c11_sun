import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
import 'package:flutter_app_news_c11_sun/home/news/cubit/news_states.dart';
import 'package:flutter_app_news_c11_sun/repository/news/dataSource/news_remote_data_source.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_data_source.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_repository.dart';
import 'package:flutter_app_news_c11_sun/repository/news/repository/news_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidgetViewModel extends Cubit<NewsStates> {
  late NewsRepository newsRepository;

  late NewsRemoteDataSource remoteDataSource;

  late ApiManager apiManager;

  NewsWidgetViewModel() : super(NewsLoadingState()) {
    apiManager = ApiManager();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
