import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:my_techanic_core/my_techanic_core.dart';
import 'package:utils/utils.dart';

@injectable
class ApiDio extends DioForNative {
  ApiDio() {
    _configureOptions();
    _configureInterceptors();
  }

  @override
  HttpClientAdapter get httpClientAdapter {
    return IOHttpClientAdapter()
      ..createHttpClient = () {
        final client = HttpClient();
        return client
          ..badCertificateCallback = (
            X509Certificate cert,
            String host,
            int port,
          ) {
            FirebaseCrashlytics.instance.recordError(
              Exception(cert.pem),
              StackTrace.fromString(cert.pem),
            );
            print(cert.pem);
            return true;
          };
      };
  }

  void _configureOptions() {
    options
      ..sendTimeout = const Duration(seconds: 10)
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10)
      ..baseUrl = Env().baseUrl;
  }

  void _configureInterceptors() {
    interceptors
      ..add(LoggerInterceptor())
      ..add(AuthorizationInterceptor())
      // TODO(ridwan): recheck this again later
      // ..add(RetryInterceptor(dio: this, retries: 2))
      ..add(AppDioCacheInterceptor())
      ..add(ErrorHandlerInterceptor(dio: this));
  }
}
