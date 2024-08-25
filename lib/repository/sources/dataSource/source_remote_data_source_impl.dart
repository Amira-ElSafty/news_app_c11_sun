import 'package:flutter_app_news_c11_sun/api/api_manager.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
