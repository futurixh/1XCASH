import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_web_seo/models/user.model.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/requests/endpoints.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';

extension Auth on ApiService {

  Future<String> getBearerToken() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');

    return 'Bearer ' + token!;
  }

  Future<User?> login() async {
    assert(phone != null);
    assert(password != null);

    log(phone.toString());
    log(password.toString());
    const storage = FlutterSecureStorage();

    try {
      final response = await dio.post(Endpoints.login, data: {"telephone": phone, "password": password});
      final user = User.fromJson(response.data["user"]);
      String js = jsonEncode(response.data["user"]);
      await storage.write(key: 'user', value: js);
      await storage.write(key: 'token', value: user.token);

      return user;

    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data["message"] != null) {
          EasyLoading.showError(e.response!.data["message"], duration: const Duration(seconds: 3));
        }
        if (e.response!.data["errors"] != null) {
          EasyLoading.showError(e.response!.data["errors"].toString(), duration: const Duration(seconds: 3));
        }
        if (kDebugMode) {
          print(e.response!.data);
          print("error");
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;

  }

  Future<String?> logout({String? token}) async {
    const storage = FlutterSecureStorage();

    String? _token = token;

    _token ??= await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.logout,
        options: Options(
          headers: {
            'authorization': _token,
          },
        ),
      );
      await storage.deleteAll();

      return response.data["message"];
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.data["message"] != null) {
          EasyLoading.showError(e.response!.data["message"], duration: const Duration(seconds: 3));
        }
        if (e.response!.data["errors"] != null) {
          EasyLoading.showError(e.response!.data["errors"].toString(), duration: const Duration(seconds: 3));
        }
        if (kDebugMode) {
          print(e.response!.data);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }


}