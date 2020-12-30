import 'package:architecture_research_sample/article_route_path.dart';
import 'package:flutter/material.dart';

class ArticleRouteInformationParser
    extends RouteInformationParser<ArticleRoutePath> {
  @override
  Future<ArticleRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return ArticleRoutePath.home();
    }

    // Handle '/article/:id'
    if (uri.pathSegments.length == 2) {
      // if (uri.pathSegments[0] != 'article') return ArticleRoutePath.unknown();
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      // if (id == null) return ArticleRoutePath.unknown();
      return ArticleRoutePath.details(id);
    }

    // Handle '/article/:id/likes'
    if (uri.pathSegments.length == 3) {
      // if (uri.pathSegments[0] != 'article') return ArticleRoutePath.unknown();
      var idString = uri.pathSegments[1];
      var id = int.tryParse(idString);
      // if (id == null) return ArticleRoutePath.unknown();

      return ArticleRoutePath.likeList(id);
    }

    // Handle unknown routes
    return ArticleRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(ArticleRoutePath configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(location: '/book/${configuration.articleId}');
    }
    if (configuration.isLikeListPage) {
      return RouteInformation(
          location: '/book/${configuration.articleId}/likes');
    }
    return null;
  }
}
