import 'package:architecture_research_sample/detail_page.dart';
import 'package:architecture_research_sample/like_list_page.dart';
import 'package:architecture_research_sample/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: AppHome(),
    ),
  );
}

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  String _selectedArticle;
  var _showLikeListPage = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: ValueKey('ListPage'),
          child: ListPage(
            onSelectedArticle: (value) {
              setState(() {
                _selectedArticle = value;
              });
            },
          ),
        ),
        if (_selectedArticle != null)
          MaterialPage(
            key: ValueKey(_selectedArticle),
            child: DetailPage(
              title: _selectedArticle,
              onLikeListTapped: () {
                setState(() {
                  _showLikeListPage = true;
                });
              },
            ),
          ),
        if (_showLikeListPage)
          MaterialPage(
            key: ValueKey('LikeListPage'),
            child: LikeListPage(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_showLikeListPage) {
          setState(() {
            _showLikeListPage = false;
          });
          return true;
        }

        setState(() {
          _selectedArticle = null;
        });

        return true;
      },
    );
  }
}
