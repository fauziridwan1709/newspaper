import 'package:dio/dio.dart';
import 'package:newspaper/core/environments/endpoints.dart';
import 'package:newspaper/core/extensions/response_extension.dart';
import 'package:newspaper/features/news/data/models/_models.dart';
import 'package:newspaper/features/news/domain/entities/_entities.dart';

abstract class NewsRemoteDataSource {
  Future<Parsed<List<ArticleModel>>> searchArticle(QuerySearchArticle query);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  NewsRemoteDataSourceImpl({this.dio});
  final Dio? dio;

  @override
  Future<Parsed<List<ArticleModel>>> searchArticle(
    QuerySearchArticle query,
  ) async {
    final list = <ArticleModel>[];
    final url = '${Endpoints.searchNews}?$query';
    final resp = await getIt(url, dio: dio);
    for (final data in resp.bodyAsMap['articles']) {
      list.add(ArticleModel.fromJson(data));
    }
    return resp.parse(list);
  }
}
