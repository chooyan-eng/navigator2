import 'package:architecture_research_sample/article_route_information_parse.dart';
import 'package:architecture_research_sample/article_router_delegate.dart';
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
  final _routeInformationParser = ArticleRouteInformationParser();
  final _routerDelegate = ArticleRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
