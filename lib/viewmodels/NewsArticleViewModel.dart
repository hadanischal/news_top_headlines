
import 'package:news_top_headlines/models/NewsArticleResult.dart';

class NewsArticleViewModel {

  Articles _newsArticle; 

  NewsArticleViewModel({Articles article}): _newsArticle = article;

  String get title { 
    return _newsArticle.title; 
  }

  String get description { 
    return _newsArticle.description;
  }

  String get imageURL {
    return _newsArticle.urlToImage; 
  }

  String get url {
    return _newsArticle.url; 
  }

}