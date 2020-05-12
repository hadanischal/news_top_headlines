import 'package:flutter/cupertino.dart';
import 'package:news_top_headlines/models/NewsArticleResult.dart';
import 'package:news_top_headlines/services/Webservice.dart';

import 'NewsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    _loadingStatusInitialStage();
    List<Articles> newsArticles =
        await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    _loadingStatusUpdate();

    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    _loadingStatusInitialStage();
    List<Articles> newsArticles = await Webservice().fetchtopHeadlines();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    _loadingStatusUpdate();
    notifyListeners();
  }

  void _loadingStatusInitialStage() {
    this.loadingStatus = LoadingStatus.searching;
  }

  void _loadingStatusUpdate() {
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
  }
}
