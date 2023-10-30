// ignore_for_file: comment_references

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
// import 'package:utils/utils.dart';

/// copied from https://pub.dev/packages/pretty_dio_logger
/// at version 1.2.0-beta-1

// @injectable
class LoggerInterceptor extends Interceptor {
  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.detail]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to print json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per print
  final int maxWidth;

  LoggerInterceptor({
    this.request = true,
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.responseBody = true,
    this.error = true,
    this.maxWidth = 90,
    this.compact = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Don't log if release mode
    if (kReleaseMode) {
      super.onRequest(options, handler);
    } else {
      Logger().i(options.data);
      super.onRequest(options, handler);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Don't log if release mode
    if (kReleaseMode) {
      super.onError(err, handler);
    } else {
      Logger().e({
        'api': '''
${err.response?.statusCode ?? 0}: ${err.requestOptions.baseUrl}${err.requestOptions.path}''',
        'headers': err.requestOptions.headers,
        'queryParams': err.requestOptions.queryParameters,
        'body': err.requestOptions.data,
        'response': err.response?.data,
        'extra': err.response?.extra,
      });
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Don't log if release mode
    if (kReleaseMode) {
      super.onResponse(response, handler);
    } else {
      final isResponseTypeBytes =
          response.requestOptions.responseType == ResponseType.bytes;
      final data = response.requestOptions.data;
      Logger().i({
        'api': '''
${response.statusCode}: ${response.requestOptions.baseUrl}${response.requestOptions.path}''',
        'authorization': response.requestOptions.headers['Authorization'],
        'headers': response.requestOptions.headers,
        'queryParams': response.requestOptions.queryParameters,
        'body': data is FormData
            ? {
                'fields': data.fields,
                'files': data.files,
              }
            : data,
        'response': isResponseTypeBytes ? null : response.data,
        'extra': response.extra,
      });
      super.onResponse(response, handler);
    }
  }
}
