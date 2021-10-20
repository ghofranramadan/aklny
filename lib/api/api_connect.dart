import 'package:aklny/utils/vars.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  static Dio dio;

  static int() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true,
    ));

    if (kDebugMode) dio.interceptors.add(logger);
  }

  static PrettyDioLogger logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    error: true,
  );
  static bool validResponse(var statusCode) =>
      statusCode >= 200 && statusCode < 300;

  static Map<String, dynamic> _apiHeaders = <String, dynamic>{
    'Content-Type': 'application/json',
    'lang': GetLAng?.lang == 'en_US' ?? true ? 'en' : 'ar',
  };

  static Future<Response> getApiData({
    @required String url,
    Map<String, dynamic> queries,
    String token,
  }) async {
    return await dio.get(
      url,
      queryParameters: queries,
      options: Options(
        headers: token != null
            ? {
                'Authorization': token,
                ..._apiHeaders,
              }
            : {
                ..._apiHeaders,
              },
      ),
    );
  }

  static Future<Response> postApiData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> queries,
    String token,
  }) async {
    return await dio.post(
      '$url',
      data: data,
      queryParameters: queries,
      options: Options(
        headers: token != null
            ? {
                'Authorization': token,
                ..._apiHeaders,
              }
            : {
                ..._apiHeaders,
              },
      ),
    );
  }

  static Future<Response> putApiData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> queries,
    String token,
  }) async {
    return await dio.put(
      '$url',
      data: data,
      queryParameters: queries,
      options: Options(
        headers: token != null
            ? {
                'Authorization': token,
                ..._apiHeaders,
              }
            : {
                ..._apiHeaders,
              },
      ),
    );
  }
}
