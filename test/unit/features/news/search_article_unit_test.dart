import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:newspaper/core/client/dio.dart';
import 'package:newspaper/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:newspaper/features/news/data/models/_models.dart';
import 'package:newspaper/features/news/domain/entities/_entities.dart';
import 'package:newspaper/services/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dio_mocks.dart';

class HttpMock extends Mock implements http.Client {}

class RequestOptionsFake extends Fake implements RequestOptions {}

void main() {
  final dio = Dio();
  late NewsRemoteDataSourceImpl dataSource;
  late QuerySearchArticle q;
  late DioAdapterMock dioAdapterMock;

  setUpAll(() {
    SharedPreferences.setMockInitialValues({});
    SharedPreferencesService.init();
    registerFallbackValue(RequestOptionsFake());
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
    dataSource = NewsRemoteDataSourceImpl(dio: dio);
    q = QuerySearchArticle(q: 'flutter');
  });

  void setUpMockSearchArticleSuccess200() {
    final responsePayload = jsonEncode(
      {
        'status': 'ok',
        'totalResults': 8588,
        'articles': [
          {
            'source': {'id': null, 'name': 'Lifehacker.com'},
            'author': 'Jeff Somers',
            'title': 'Is the Crypto Bubble Going to Burst?',
            'description': '''
Even if you aren’t paying attention to Bitcoin and other cryptocurrencies, you might have noticed that their value plummeted last week, with the total value of the market tumbling from a high of 3 trillion last year to about 1.5 trillion in a matter of days…''',
            'url':
                'https://lifehacker.com/is-the-crypto-bubble-going-to-burst-1848475768',
            'urlToImage':
                'https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/976a59b09e0e681e692bd7517498e3f2.jpg',
            'publishedAt': '2022-02-09T16:00:00Z',
            'content': '''
Even if you arent paying attention to Bitcoin and other cryptocurrencies, you might have noticed that their value plummeted last week, with the total value of the market tumbling from a high of 3 tr… [+4782 chars]'''
          }
        ]
      },
    );
    final httpResponse = ResponseBody.fromString(
      responsePayload,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
    when(
      () => dioAdapterMock.fetch(
        any(),
        any(),
        any(),
      ),
    ).thenAnswer((invocation) async => httpResponse);
  }

  group('Github Search Remote Data Source Test', () {
    test('Github search user unit test', () async {
      // arrange
      setUpMockSearchArticleSuccess200();
      // act
      final resp = await dataSource.searchArticle(q);
      // assert
      expect(resp.statusCode, 200);
      expect(resp.data.first.toJson(), isA<Map<String, dynamic>>());
      expect(resp.data.first.hashCode, isA<int>());
      expect(resp.data.first == ArticleModel(), false);
      // ignore:unrelated_type_equality_checks
      expect(resp.data.first == SourceModel(), false);
    });

    test('Garbage unit test', () async {
      // arrange
      setUpMockSearchArticleSuccess200();
      // act
      final resp = await postIt('http', dio: dio);
      // assert
      expect(resp.statusCode, 200);
    });

    test('Garbage unit test', () async {
      // arrange
      setUpMockSearchArticleSuccess200();
      // act
      final resp = await deleteIt('http', dio: dio);
      // assert
      expect(resp.statusCode, 200);
    });

    test('Garbage unit test', () async {
      // arrange
      setUpMockSearchArticleSuccess200();
      // act
      final resp = await putIt('http', dio: dio);
      // assert
      expect(resp.statusCode, 200);
    });

    test('Garbage unit test', () async {
      // arrange
      setUpMockSearchArticleSuccess200();
      // act
      final resp = await putIt('http', dio: dio);
      // assert
      expect(resp.statusCode, 200);
    });
  });
}
