import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> articles;
  final ValueChanged<int> onSelectedArticle;

  const ListPage({
    Key key,
    this.articles,
    this.onSelectedArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => onSelectedArticle(index),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(articles[index]),
            ),
          ),
        ),
      ),
    );
  }
}
