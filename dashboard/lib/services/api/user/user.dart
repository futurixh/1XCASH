import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_seo/models/user.model.dart';
import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:flutter_web_seo/services/api/auth/auth.dart';
import 'package:flutter_web_seo/services/api/requests/dio.dart';

import '../requests/endpoints.dart';

extension Users on ApiService {

  Future<List<User>> getUsers() async {
    List<User> users = [];
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getUsers,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      final rawUsers = response.data['users'];
      for (var i = 0; i < rawUsers.length; i++) {
        users.add(User.fromJson(rawUsers[i]));
      }
      return users;
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return users;
  }

  Future<String?> deleteUser(String id) async {
    List<User> users = [];
    String token = await getBearerToken();

    try {
      final response = await dio.delete(
        Endpoints.deleteUser + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );

      return response.data["message"];
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }

  Future<User?> verifyUser(String id) async {
    String token = await getBearerToken();

    try {
      final response = await dio.put(
        Endpoints.verifyUser + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      final user = User.fromJson(response.data["user"]);

      return user;
    } on DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
          print(e.response!.headers);
          print(e.response!.requestOptions);
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