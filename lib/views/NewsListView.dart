import 'package:flutter/material.dart';
import 'package:news_top_headlines/viewmodels/NewsArticleListViewModel.dart';
import 'package:provider/provider.dart';

/*
class NewsListView extends StatefulWidget {
  @override 
  _NewsListState createState() => _NewsListState(); 
}

//Second way
class _NewsListState extends State<NewsListView> {

  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context,listen: false).populateTopHeadlines();
  }
*/

/// One way
class NewsListView extends StatelessWidget {
  // NewsArticleListViewModel _viewModel = NewsArticleListViewModel();

  // NewsListView() {
  //   _viewModel.populateTopHeadlines;
  // }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: ListView.builder(
          itemCount: vm.articles.length,
          itemBuilder: (context, index) {

            final article = vm.articles[index];
            var newsImage = article.imageURL != null ? Image.network(article.imageURL) : Image.asset("assets/news-placeholder.png");
            var imageContainer = Container(width: 100, height: 100, child: newsImage);

            return ListTile(
              leading: imageContainer,
              title: Text(article.title),
            );
          },
        ));
  }
}
