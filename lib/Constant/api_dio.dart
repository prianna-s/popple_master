import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'common_constant.dart';
import 'enums.dart';
import 'global_configuration.dart';

BaseOptions options = BaseOptions(
  baseUrl: getURL(),
  // connectTimeout: Duration(seconds: 10),
  // receiveTimeout: Duration(seconds: 10),
  maxRedirects: 2,
  responseType: ResponseType.json,
  contentType: "application/json",
  validateStatus: (status) {
    return status! < 500;
  },
);

var _apiDio = Dio(options);

bool isLoading = false;

Dio httpClient() {
    _apiDio.interceptors.add(PrettyDioLogger(
      requestHeader: !kReleaseMode,
      requestBody: !kReleaseMode,
      responseBody: !kReleaseMode,
    ));
  _apiDio.interceptors.add(HeaderInterceptor());
  (_apiDio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  return _apiDio;
}

Dio httpClientWithHeader() {
  Map<String,dynamic>header=Map();
  // header['Authorization']='Bearer ${setting.value.authToken}';
  _apiDio.options.headers=header;
    _apiDio.interceptors.add(PrettyDioLogger(
      requestHeader: !kReleaseMode,
      requestBody: !kReleaseMode,
      responseBody: !kReleaseMode,
    ));

  (_apiDio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  return _apiDio;
}


class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _apiDio.interceptors.clear();
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _apiDio.interceptors.clear();

    return super.onError(err, handler);
  }
}

String getURL(){
  return GlobalConfiguration().getValue('api_url').toString();
}
