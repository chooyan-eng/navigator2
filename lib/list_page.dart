import 'package:architecture_research_sample/detail_page.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  static const articles = [
    'Flutter 101',
    'Introduction to Flutter',
    'Inside Flutter',
    'Flutter Advanced',
  ];

  final ValueChanged<String> onSelectedArticle;

  const ListPage({
    Key key,
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
            onTap: () => onSelectedArticle(articles[index]),
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
