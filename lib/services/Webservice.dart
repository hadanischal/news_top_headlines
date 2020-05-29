import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_top_headlines/models/articles.dart';
import 'package:news_top_headlines/models/news_article_result.dart';
import 'package:news_top_headlines/utils/Constants.dart';

class Webservice {
  Future<List<Articles>> fetchHeadlinesByKeyword(String keyword) async {
    final response = await http.get(Constants.headlinesFor(keyword));
    return _request(response);
  }

  Future<List<Articles>> fetchtopHeadlines() async {
    final response = await http.get(Constants.topHeadlinesUrl);
    return _request(response);
  }

  List<Articles> _request(http.Response response) {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      // Iterable list = result["articles"];
      // return list.map((article) => Articles.fromJSON(article)).toList();

      final articleResult = NewsArticleResult.fromJson(result);
      return articleResult.articles;
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
