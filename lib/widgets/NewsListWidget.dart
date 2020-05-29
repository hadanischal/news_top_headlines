import 'package:flutter/material.dart';
import 'package:news_top_headlines/viewmodels/NewsArticleViewModel.dart';

class NewsListWidget extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsListWidget({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        var newsImage = article.imageURL != null
            ? Image.network(article.imageURL)
            : Image.asset("assets/news-placeholder.png");
        var imageContainer =
            Container(width: 100, height: 100, child: newsImage);

        return ListTile(
          onTap: () {
            this.onSelected(article);
            // _showNewsArticleDetails(context, article);
          },
          leading: imageContainer,
          title: Text(article.title),
        );
      },
    );
  }

  // void _showNewsArticleDetails(
  //     BuildContext context, NewsArticleViewModel article) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (_) => NewsArticleDetailsView(
  //         article: article,
  //       ),
  //     ),
  //   );
  // }
}
