import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/model/NewsResponse.dart';
import 'package:news/core/model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '9a951f3b1e244b21a77c0cccb199e2c9';

  static Future<SourcesResponse> getSources(String categoryID) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryID,
    });
    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews(
      {String? soureID, String? searchWord}) async {
    var url = Uri.https(baseUrl, 'v2/everything', {
      'q': searchWord,
      'apiKey': apiKey,
      'sources': soureID,
    });
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
}
