import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(baseUrl: 'https://www.qaconnectivity.com',
  connectTimeout: Duration(seconds: 3),
  receiveTimeout: Duration(seconds: 5),
  sendTimeout: Duration(seconds: 8)
)

);
