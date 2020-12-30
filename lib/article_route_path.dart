class ArticleRoutePath {
  int articleId;
  var showLikeListPage = false;

  ArticleRoutePath.home()
      : articleId = null,
        showLikeListPage = false;

  ArticleRoutePath.details(this.articleId) : showLikeListPage = false;

  ArticleRoutePath.likeList(this.articleId) : showLikeListPage = true;

  bool get isHomePage => articleId == null;

  bool get isDetailsPage => articleId != null && !showLikeListPage;

  bool get isLikeListPage => articleId != null && showLikeListPage;
}
