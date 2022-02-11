part of '_bloc.dart';

abstract class SearchArticleEvent {}

class SearchArticle extends SearchArticleEvent {
  QuerySearchArticle querySearch;

  SearchArticle({
    required this.querySearch,
  });
}

class SearchMoreArticle extends SearchArticleEvent {
  SearchMoreArticle();
}
