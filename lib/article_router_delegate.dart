import 'package:architecture_research_sample/article_route_path.dart';
import 'package:architecture_research_sample/detail_page.dart';
import 'package:architecture_research_sample/like_list_page.dart';
import 'package:architecture_research_sample/list_page.dart';
import 'package:flutter/material.dart';

class ArticleRouterDelegate extends RouterDelegate<ArticleRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ArticleRoutePath> {
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

  ArticleRoutePath get currentConfiguration {
    if (_articleId != null) {
      if (_showLikeListPage) {
        return ArticleRoutePath.likeList(_articleId);
      } else {
        return ArticleRoutePath.details(_articleId);
      }
    }
    return ArticleRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
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
    );
  }

  @override
  Future<void> setNewRoutePath(ArticleRoutePath configuration) async {
    if (configuration.isDetailsPage) {
      _articleId = configuration.articleId;
      _showLikeListPage = false;
      return;
    }

    if (configuration.isLikeListPage) {
      _articleId = configuration.articleId;
      return;
    }

    _articleId = null;
    _showLikeListPage = false;
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    return super.popRoute();
  }
}
