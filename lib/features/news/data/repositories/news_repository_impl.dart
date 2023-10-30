part of '_repositories.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _remoteDataSource;

  NewsRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, Parsed<List<ArticleModel>>>> searchArticle(
    QuerySearchArticle query,
  ) {
    return apiCall(_remoteDataSource.searchArticle(query));
  }
}
