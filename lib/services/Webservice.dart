
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_top_headlines/models/NewsArticleResult.dart';



class Webservice {
  
  Future<List<Articles>> fetchtopHeadlines() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=8fa8303737ca441d9417e52672307439";

    final response = await http.get(url);

    if (response.statusCode == 200) {
      
      final result = jsonDecode(response.body);

      // Iterable list = result["articles"];
      // return list.map((article) => Articles.fromJSON(article)).toList();

      final articleResult =  NewsArticleResult.fromJson(result);
      return articleResult.articles;

    } else {
      throw Exception("Failed to get top news");
    }

  }

}