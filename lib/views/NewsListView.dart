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

    var searchIcon = Icon(Icons.search);

    var sarchTextField = TextField(
      controller: _controller,
      onSubmitted: (_) {
        // TODO: fetch all news
      },
      decoration: InputDecoration(
        labelText: "Search",
        icon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: searchIcon,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear), 
          onPressed: () {
            _controller.clear();
          }
          ),
      ),
    );

    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: Column(children: <Widget>[
          sarchTextField,
          Expanded(
            child: NewsListWidget(
              articles: vm.articles,
              onSelected: (_) {},
            ),
          )
        ]));
  }
}
