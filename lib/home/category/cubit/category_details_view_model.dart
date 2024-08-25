import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
import 'package:flutter_app_news_c11_sun/home/category/cubit/source_states.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/dataSource/source_offline_data_source_impl.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/dataSource/source_remote_data_source_impl.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/repository/source_repository_impl.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_data_source.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceState> {
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource remoteDataSource;
  late SourceOfflineDataSource offlineDataSource;

  late ApiManager apiManager;

  CategoryDetailsViewModel() : super(SourceLoadingState()) {
    apiManager = ApiManager();
    remoteDataSource = SourceRemoteDataSourceImpl(apiManager: apiManager);
    offlineDataSource = SourceOfflineDataSourceImpl();
    sourceRepository = SourceRepositoryImpl(
        remoteDataSource: remoteDataSource,
        offlineDataSource: offlineDataSource);
  }

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
