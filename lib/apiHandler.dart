import 'package:dio/dio.dart';
import 'dart:async';
import 'appExceptions.dart';

Map<String, dynamic> optHeader = {
  'accept-language': 'utf-8',
  'content-type': 'application/json'
};


class ApiHandler {
  static final ApiHandler _instance = ApiHandler._internal();
  var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

  ApiHandler._internal() {
    initDio();
  }

  factory ApiHandler() {
    return _instance;
  }

  initDio(){
    dio.interceptors.add(LogInterceptor());
  }

  Future get(String url, [Map<String, dynamic> params]) async {
    try {
      var response;
      if (params != null) {
        response = await dio.get(url, queryParameters: params);
      } else {
        response = await dio.get(url);
      }
      return response.data;
    } on DioError catch (e) {
      handleError(e: e);
    }
  }

  Future post(String url, Map<String, dynamic> params) async {
    try {
      var response;
      if (params != null) {
        response = await dio.post(url, data: params);
      } else {
        response = await dio.post(url);
      }
      return response.data;
    } on DioError catch (e) {
      handleError(e: e);
    }
  }
}

dynamic handleError({DioError e}) {
  switch (e.response.statusCode) {
    case 400:
      throw BadRequestException(e.response.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(e.response.data.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${e.response.statusCode}');
  }
}

ApiHandler apiHandler = ApiHandler();