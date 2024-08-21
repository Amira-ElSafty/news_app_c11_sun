import 'package:flutter_app_news_c11_sun/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_data_source.dart';
import 'package:flutter_app_news_c11_sun/repository/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
