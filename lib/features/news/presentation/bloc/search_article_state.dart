part of '_bloc.dart';

abstract class SearchArticleState extends Equatable {
  const SearchArticleState();
}

class SearchArticleInitial extends SearchArticleState {
  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersInitial';
  }
}

class SearchArticleLoading extends SearchArticleState {
  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersLoading';
  }
}

class SearchArticleError extends SearchArticleState {
  final Failure failure;

  const SearchArticleError({required this.failure});

  @override
  List<Object> get props => <Object>[];

  @override
  String toString() {
    return 'GithubUsersError';
  }
}

class SearchArticleSuccess extends SearchArticleState {
  const SearchArticleSuccess({
    this.articles,
    required this.query,
    required this.totalCount,
    required this.type,
    required this.length,
    required this.hasReachedMax,
  });

  final List<ArticleModel>? articles;
  final QuerySearchArticle query;
  final int totalCount;
  final int type;
  final int length;
  final bool hasReachedMax;

  @override
  List<Object> get props => <Object>[
        if (articles != null) ...articles!,
        query,
        totalCount,
        type,
        length,
        hasReachedMax,
      ];

  @override
  String toString() {
    return 'GithubUsersSuccess';
  }

  SearchArticleSuccess copyWith({
    List<ArticleModel>? articles,
    QuerySearchArticle? query,
    int? totalCount,
    int? type,
    int? length,
    bool? hasReachedMax,
  }) {
    return SearchArticleSuccess(
      articles: articles ?? this.articles,
      query: query ?? this.query,
      totalCount: totalCount ?? this.totalCount,
      type: type ?? this.type,
      length: length ?? this.length,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
