part of '_bloc.dart';

class SearchArticleBloc extends Bloc<SearchArticleEvent, SearchArticleState> {
  SearchArticleBloc() : super(SearchArticleInitial()) {
    final _remoteDataSource = NewsRemoteDataSourceImpl(dio: ApiDio());
    _repo = NewsRepositoryImpl(_remoteDataSource);
    on<SearchArticle>(_searchData);
    on<SearchMoreArticle>(_searchMoreData);
  }

  late NewsRepository _repo;
  bool isFetching = false;
  bool hasReachedMax = true;

  Future<void> _searchData(
    SearchArticle event,
    Emitter<SearchArticleState> emit,
  ) async {
    emit(SearchArticleLoading());
    final query = event.querySearch..page = 1;
    await __searchData(query, emit);
  }

  Future<void> __searchData(
    QuerySearchArticle query,
    Emitter<SearchArticleState> emit,
  ) async {
    print('search data');
    emit(SearchArticleLoading());
    final resp = await _repo.searchArticle(query);
    resp.fold((failure) {
      AppLogger.e(failure.message);
      emit(SearchArticleError(failure: failure));
    }, (result) {
      print(result.data);
      final reachedMax = result.data.length < query.pageSize;
      emit(
        SearchArticleSuccess(
          articles: result.data,
          query: query,
          totalCount: result.totalCount,
          type: 0,
          length: result.data.length,
          hasReachedMax: reachedMax,
        ),
      );
    });
  }

  Future<void> _searchMoreData(
    SearchMoreArticle event,
    Emitter<SearchArticleState> emit,
  ) async {
    final successState = state as SearchArticleSuccess;
    final query = successState.query;
    ++query.page;
    final resp = await _repo.searchArticle(query);
    resp.fold((failure) {
      AppLogger.e(failure.message);
      emit(SearchArticleError(failure: failure));
    }, (result) {
      final reachedMax = result.data.length < query.pageSize;
      final articles = successState.articles;
      articles?.addAll(result.data);
      emit(
        successState.copyWith(
          articles: articles,
          length: articles!.length,
          hasReachedMax: reachedMax,
        ),
      );
    });
    isFetching = false;
  }
}
