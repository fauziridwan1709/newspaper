part of '_repositories.dart';

abstract class NewsRepository {
  Future<Decide<Failure, Parsed<List<ArticleModel>>>> searchArticle(
    QuerySearchArticle q,
  );
}
