import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(String categoryId);
}

abstract class SourceOfflineDataSource {
  Future<SourceResponse?> getSources(String categoryId);

  void saveSources(SourceResponse? sourceResponse, String category);
}
