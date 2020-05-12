import 'package:flutter/material.dart';
import 'package:news_top_headlines/viewmodels/NewsArticleListViewModel.dart';
import 'package:news_top_headlines/widgets/NewsListWidget.dart';
import 'package:provider/provider.dart';

class NewsListView extends StatefulWidget {
  @override
  _NewsListViewState createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: Column(children: <Widget>[
          _buildSearchTextField(vm),
          _buildNewsList(context,vm),
        ]));
  }

  Widget _buildNewsList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.completed:
        return Expanded(
          child: NewsListWidget(
            articles: vm.articles,
            onSelected: (_) {},
          ),
        );
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());
      case LoadingStatus.empty:
        return Align(
          child: Text("No result found"),
        );
    }
     return Container();
  }

  TextField _buildSearchTextField(NewsArticleListViewModel vm) {
    return TextField(
      controller: _controller,
      onSubmitted: (keyword) {
        if (keyword.isNotEmpty) {
          vm.search(keyword);
        }
      },
      decoration: InputDecoration(
        labelText: "Search",
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.search),
        ),
        suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
            }),
      ),
    );
  }
}
