part of '_repositories.dart';

abstract class NewsRepository {
  Future<Either<Failure, Parsed<List<ArticleModel>>>> searchArticle(
    QuerySearchArticle q,
  );
}
