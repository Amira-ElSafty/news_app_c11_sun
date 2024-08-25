import 'package:flutter_app_news_c11_sun/home/news/cubit/news_states.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidgetViewModel extends Cubit<NewsStates> {
  NewsRepository newsRepository;

  NewsWidgetViewModel({required this.newsRepository})
      : super(NewsLoadingState());

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
