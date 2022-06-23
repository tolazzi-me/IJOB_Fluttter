import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/network/dio_provider.dart';
import 'package:ijob_app/network/error_handler.dart';

import '../../network/exceptions/base_exception.dart';

abstract class BaseRemoteSource {
  Dio get dioClient => DioProvider.dioWithHeaderToken;

  Future<Either<Exception, Response<T>>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      return right(response);
    } on DioError catch (dioError) {
      Exception exception = handleDioError(dioError);
      log('Throwing error from repository: > $exception : ${(exception as BaseException).message}');
      // throw exception;
      return left(exception);
    } catch (error) {
      log('Generic error: > $error');
      if (error is BaseException) {
        // rethrow;
      }
      // throw handleError('$error');
      return left(handleError('$error'));
    }
  }
}
