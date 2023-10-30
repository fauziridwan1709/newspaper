import 'package:dio/dio.dart';

// import 'package:injectable/injectable.dart';
//
// import '../my_techanic_core.dart';
//
// @injectable
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    // final sessionManager = getIt<SessionManager>();
    // final accessToken = sessionManager.accessToken;
    //
    // options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}
