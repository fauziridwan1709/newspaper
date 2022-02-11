part of '_entities.dart';

class QuerySearchArticle {
  String q;
  int page;
  int pageSize;
  String? apiKey;

  QuerySearchArticle({
    this.q = '',
    this.page = 1,
    this.pageSize = 15,
    this.apiKey,
  });

  @override
  String toString() {
    final data = <String, String>{};
    data['q'] = q.isEmpty ? 'apple' : q;
    data['page'] = page.toString();
    data['pageSize'] = pageSize.toString();
    data['apiKey'] = 'e2e2806d9e13466ca826020fabc551e1';

    return Uri(queryParameters: data).query;
  }
}
