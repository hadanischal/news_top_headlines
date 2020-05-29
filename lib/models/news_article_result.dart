import 'package:json_annotation/json_annotation.dart';

import 'articles.dart';
part 'news_article_result.g.dart';

@JsonSerializable()
class NewsArticleResult {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  NewsArticleResult({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsArticleResult.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleResultFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleResultToJson(this);
}
