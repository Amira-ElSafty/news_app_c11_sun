import 'package:flutter_app_news_c11_sun/home/category/cubit/source_states.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceState> {
  SourceRepository sourceRepository;

  CategoryDetailsViewModel({required this.sourceRepository})
      : super(SourceLoadingState());

  //todo: hold data - handle logic

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await sourceRepository.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
