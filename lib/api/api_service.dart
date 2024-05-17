// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
// ignore: unused_import
import 'package:news/models/news_response/news_response.dart';
import 'package:news/models/sourses_response/sourses_response.dart';

class APIService {
  static Future<SoursesResponse> getSources(String categoryId) async {
    try {
      final uri = Uri.https(
        'newsapi.org',
        '/v2/top-headlines/sources',
        {
          'apiKey': APIConstants.apiKey,
          'category': categoryId,
        },
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return SoursesResponse.fromJson(json);
    } catch (error) {
      //print(error);
      rethrow;
    }
  }

  static Future getNews(String sourceId, Set<dynamic> set,
      {required String searchKeyword}) async {
    try {
      final uri = Uri.https(
        APIConstants.baseUrl,
        APIConstants.newsEndpoint,
        {
          'apiKey': APIConstants.apiKey,
          'sources': sourceId,
        },
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return News.fromJson(json);
    } catch (error) {
      // print(error);
      rethrow;
    }
  }
}
