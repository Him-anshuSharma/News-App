// ignore_for_file: unnecessary_brace_in_string_interps

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpService {
  late Dio dio;
  final baseUrl = "https://newsapi.org/v2/";
  final apiKey = "16d2ba05ce0644e0be6536b97767fed1";

  HttpService() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }

  Future<Response> getRequest() async {
    Response response;
    try {
      response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=in&apiKey=${apiKey}");
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    //print(response);
    return response;
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, e) {
        if (kDebugMode) {
          print(error.message);
        }
      },
      onRequest: (request, e) {
        if (kDebugMode) {
          print("${request.method} ${request.path}");
        }
      },
      onResponse: (response, e) {
        if (kDebugMode) {
          print(response.data);
        }
      },
    ));
  }
}
