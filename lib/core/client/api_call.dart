import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:newspaper/core/errors/failures.dart';

/// Mapping api call into either success or failure.
/// Returns Either.
Future<Either<Failure, T>> apiCall<T>(Future<T> t) async {
  try {
    Logger().i(t.toString());
    final futureCall = await t;
    return Right(futureCall);
  } on DioException catch (e) {
    // AppLogger.instance.error(e, stackTrace: e.stackTrace);
    if (e.error is ArgumentError) {
      final error = e.error as ArgumentError?;
      return Left(GeneralFailure(message: error?.message));
    } else if (e.error is SocketException) {
      return Left(NetworkFailure());
    } else if (e.error is TimeoutException) {
      return Left(TimeoutFailure());
    } else if (e.error is FormatException) {
      return Left(GeneralFailure(message: 'RuntimeErrorMessages.format'));
    }

    final failure = DioFailure.fromDioError(e);
    final message = failure.message;
    final code = failure.statusCode;
    // if (code == 403) return Left(UnauthorizedFailure(message: message));
    if (code == 404) return Left(NotFoundFailure(message: message));
    return Left(GeneralFailure(message: message));
  } catch (e, stacktrace) {
    Logger().e({
      'stacktrace': stacktrace,
      'type': e.runtimeType,
      'toString()': e.toString(),
    });
    if (e is TypeError) {
      return Left(GeneralFailure(message: 'RuntimeErrorMessages.typeError'));
    } else if (e is TimeoutException) {
      return Left(TimeoutFailure());
    }

    return Left(GeneralFailure());
  }
}
