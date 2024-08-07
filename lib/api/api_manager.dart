import 'dart:convert';

import 'package:flutter_app_news_c11_sun/api/api_constatnts.dart';
import 'package:flutter_app_news_c11_sun/model/NewsResponse.dart';
import 'package:flutter_app_news_c11_sun/model/SourceResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sourcesApi,
        {'apiKey': '500c5a4f9b244f3db92a47f436f1819e'});
    var response = await http.get(url);
    try {
      var responseBody = response.body;

      /// String
      var json = jsonDecode(responseBody);

      /// json
      return SourceResponse.fromJson(json);

      /// object
    } catch (e) {
      throw e;
    }

    // SourceResponse.fromJson(jsonDecode(response.body));
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsApi, {
      'apiKey': '500c5a4f9b244f3db92a47f436f1819e',
      'sources': sourceId,
    });
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
