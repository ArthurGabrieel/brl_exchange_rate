import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../errors/exceptions.dart';

class HttpClient {
  HttpClient(this.dio) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['apiKey'] = apiKey;
        return handler.next(options);
      },
    ));
  }

  final Dio dio;

  final baseUrl = 'https://api-brl-exchange.actionlabs.com.br/api/1.0/';
  final apiKey = 'RVZG0GHEV2KORLNA';

  Future<Response> get(
    String endpoint,
    Map<String, String> queryParams,
  ) async {
    try {
      return await dio.get(endpoint, queryParameters: queryParams);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode;
        debugPrint('Status code: $statusCode');
        switch (statusCode) {
          case 401:
            throw UnauthorizedException();
          case 403:
            throw ForbiddenException();
          case 404:
            throw NotFoundException();
          default:
            throw ServerException();
        }
      }
      throw ServerException();
    }
  }
}
