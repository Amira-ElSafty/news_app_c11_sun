import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';
import 'package:flutter_app_news_c11_sun/repository/sources/source_data_source.dart';
import 'package:hive/hive.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    var data = SourceResponse.fromJson(box.get(categoryId));

    /// map => object
    return data;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String category) async {
    var box = await Hive.openBox('tabs');
    await box.put(category, sourceResponse?.toJson());

    /// map
    await box.close();
  }
}
