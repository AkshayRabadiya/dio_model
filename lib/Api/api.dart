import 'dart:io';

import 'package:dio/dio.dart';
import 'http_manager.dart';

class Api {
  static var httpManager = HTTPManager();

  ///Login API
  static Future<YourModel> requestLogin(params) async {
    final result = await httpManager.post(
      url: --Your URL--,
      data: params,
      loading: true,
    );
    return YourModel.fromJson(result);
  }

  ///Get Category API
  static Future<YourModel> requestCategory(headers, params) async {
    final result = await httpManager.get(
        url: --Your URL--,
        options: Options(headers: headers),
        loading: true,
        params: params);
    return YourModel.fromJson(result);
  }

  ///Chat API
  static Future<AnswerModel> requestChatGtp(params) async {
    final result = await httpManager.post(
      url: "completions",
      data: params,
      loading: true,
    );
    return AnswerModel.fromJson(result);
  }
}
