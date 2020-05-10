import 'package:flutter/cupertino.dart';
import 'package:news_top_headlines/models/NewsArticleResult.dart';
import 'package:news_top_headlines/services/Webservice.dart';

import 'NewsArticleViewModel.dart';


class NewsArticleListViewModel extends ChangeNotifier {

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>(); 

  // NewsArticleListViewModel () {
  //   _populateTopHeadlines();
  // }

  Future<void> populateTopHeadlines() async {
    List<Articles> newsArticles = await Webservice().fetchtopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners(); 
  }

}