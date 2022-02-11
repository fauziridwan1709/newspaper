import 'package:dio/dio.dart';

class Parsed<T> {
  Parsed.fromJson(
    Map<String, dynamic> json,
    this.statusCode,
    this.data,
  ) {
    message = json['error'] ?? json['detail'] ?? '';
    totalCount = json['total_count'] ?? json['totalResults'] ?? 0;
  }

  late int statusCode;
  late int totalCount;
  late String message;
  late T data;
}

extension ResponseExtension<T> on Response {
  //ignore:avoid_shadowing_type_parameters
  Parsed<T> parse<T>(T t) {
    return Parsed.fromJson(
      data as Map<String, dynamic>,
      statusCode!,
      t,
    );
  }

  /// Get iterable data
  Map<String, dynamic> get bodyAsMap => data as Map<String, dynamic>;
}
