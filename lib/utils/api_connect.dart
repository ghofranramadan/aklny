import 'package:aklny/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiProvider {
  //Singleton
  ApiProvider._() {
    // Attach Logger
    if (kDebugMode) _dio.interceptors.add(_logger);
  }

  static final ApiProvider instance = ApiProvider._();

  // Http Client
  final Dio _dio = Dio();

  // Logger
  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    error: true,
  );

  // Headers
  final Map<String, dynamic> _apiHeaders = <String, dynamic>{
    'Accept': 'application/json',
  };
  ////////////////////////////// END POINTS //////////////////////////////////////

////////////////////////////////// UTILS ///////////////////////////////////////
  // Validating Request.
  bool _validResponse(int statusCode) => statusCode >= 200 && statusCode < 300;

  // Getting User Token.
  Future<String> _getUserToken() async => await UserModel.getToken();
}
