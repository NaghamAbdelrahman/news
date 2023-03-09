import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/NewsResponseDTO.dart';
import '../model/SourcesResponseDTO.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '9a951f3b1e244b21a77c0cccb199e2c9';

  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<SourcesResponseDTO> getSources(String categoryID) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources', {
      'apiKey': apiKey,
      'category': categoryID,
    });
    var response = await http.get(url);
    return SourcesResponseDTO.fromJson(jsonDecode(response.body));
  }

  Future<NewsResponseDTO> getNews(
      {String? sourceID, String? searchWord, int? page}) async {
    var url = Uri.https(baseUrl, 'v2/everything', {
      'q': searchWord,
      'apiKey': apiKey,
      'sources': sourceID,
      'page': '$page',
      'pageSize': '20',
    });
    var response = await http.get(url);
    return NewsResponseDTO.fromJson(jsonDecode(response.body));
  }
}
