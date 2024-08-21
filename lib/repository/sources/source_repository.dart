import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';

/// interface
abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId);
}
