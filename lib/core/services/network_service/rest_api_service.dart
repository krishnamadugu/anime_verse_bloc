import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants/app_constants/api_constants/api_headers.dart';
import '../../constants/app_constants/api_constants/api_urls.dart';

class ApiServices {
  String url;

  ApiServices({required this.url});

  Future<http.Response> getRequest({
    String bearerToken = '',
  }) async {
    var authHeader = "Bearer $bearerToken";

    debugPrint("get $url access token --> $bearerToken");

    var tempUri = Uri.parse(url);
    var response = await http.get(
      tempUri,
      headers: {
        ApiHeaders.kContentType: ApiHeaders.kApplicationJson,
        ApiHeaders.kAccept: ApiHeaders.kApplicationJson,
        ApiHeaders.kAuthorization: authHeader,
        ApiHeaders.kRapidApiHost: ApiUrls.rapidApiHostVal,
        ApiHeaders.kRapidApiKey: ApiUrls.rapidApiKeyVal,
      },
    ).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );

    debugPrint("GET $url ---> ${response.body}");

    if (response.statusCode == 401) {
      throw "Un Authorized";
    }

    return response;
  }

  Future<Response> dioPostRequest(
    Map<String, dynamic> jsonData, {
    String bearerToken = '',
  }) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 60), // 60 seconds
        receiveTimeout: const Duration(seconds: 60), // 60 seconds
      ),
    );
    FormData formData = FormData.fromMap(jsonData);
    dio.options.headers[ApiHeaders.kContentType] =
        ApiHeaders.kMultipartFormData;
    dio.options.headers[ApiHeaders.kAuthorization] = "Bearer $bearerToken";
    dio.options.headers[ApiHeaders.kRapidApiKey] = ApiUrls.rapidApiKeyVal;
    dio.options.headers[ApiHeaders.kRapidApiHost] = ApiUrls.rapidApiHostVal;

    debugPrint("POST $url  json Data --> $jsonData");

    try {
      final response = await dio.post(url, data: formData);

      debugPrint("POST $url --> $response");

      if (response.statusCode == 401) {
        throw "Un Authorized";
      }

      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        rethrow;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
