import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:async';
import 'appExceptions.dart';
export 'package:connectivity/connectivity.dart';

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

  /// init method
  factory ApiHandler() {
    return _instance;
  }

  /// init Dio
  initDio() {
    dio.interceptors.add(LogInterceptor());
  }

  // get method
  Future get(String url, [Map<String, dynamic>? params]) async {
    try {
      final response = await dio.get(url, queryParameters: params);
      return response.data;
    } on DioError catch (e) {
      handleError(e: e);
    }
  }

  /// post method
  Future post(String url, Map<String, dynamic> params) async {
    try {
      final response = await dio.post(url, data: params);
      return response.data;
    } on DioError catch (e) {
      handleError(e: e);
    }
  }

  /// checkConnectivity
  Future<ConnectivityResult> checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult;
  }

  /// onConnectivityChanged
  Stream<ConnectivityResult> get onConnectivityChanged {
    return Connectivity().onConnectivityChanged;
  }
}

/// handleError
dynamic handleError({required DioError e}) {
  final statusCode = e.response?.statusCode ?? -1;
  switch (statusCode) {
    case 400:
      throw BadRequestException(e.response?.data.toString());
    case 401:
    case 403:
      throw UnauthorisedException(e.response?.data.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : $statusCode');
  }
}

ApiHandler apiHandler = ApiHandler();
