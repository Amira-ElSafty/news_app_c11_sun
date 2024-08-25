import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
import 'package:flutter_app_news_c11_sun/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  /// constructor injection

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;
  }
}
