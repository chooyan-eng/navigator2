import 'package:architecture_research_sample/pages/detail_page.dart';
import 'package:architecture_research_sample/pages/like_list_page.dart';
import 'package:architecture_research_sample/pages/list_page.dart';
import 'package:flutter/material.dart';

class ArticleRouterDelegate extends RouterDelegate<void>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<void> {
  final GlobalKey<NavigatorState> navigatorKey;

  static const articles = [
    'Flutter 101',
    'Introduction to Flutter',
    'Inside Flutter',
    'Flutter Advanced',
  ];

  int _articleId;
  var _showLikeListPage = false;

  ArticleRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: ValueKey('ListPage'),
            child: ListPage(
              articles: articles,
              onSelectedArticle: (value) {
                _articleId = value;
                notifyListeners();
              },
            ),
          ),
          if (_articleId != null)
            MaterialPage(
              key: ValueKey(_articleId),
              child: DetailPage(
                title: articles[_articleId],
                onLikeListTapped: () {
                  _showLikeListPage = true;
                  notifyListeners();
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
            _showLikeListPage = false;
            notifyListeners();
            return true;
          }

          _articleId = null;

          notifyListeners();
          return true;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(void configuration) async {
    // do nothing
  }
}
