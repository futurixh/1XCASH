import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:x1xcash/app/core/models/user.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../requests/dio.dart';

extension ApiAuth on ApiService {
  Future<String> getBearerToken() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');

    return 'Bearer ' + token!;
  }

  Future<User?> register({
    required String lastname,
    required String firstname,
    required String email,
    required String password,
    required String telephone,
  }) async {
    try {
      final response = await dio.post(Endpoints.register, data: {
        "lastname": lastname,
        "firstname": firstname,
        "email": email,
        "password": password,
        "telephone": telephone,
      });

      return User.fromJson(response.data["user"]);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> login() async {
    assert(email != null);
    assert(password != null);

    const storage = FlutterSecureStorage();

    try {
      final response = await dio.post(Endpoints.login, data: {
        "email": email,
        "password": password,
      });

      final user = User.fromJson(response.data["user"]);
      await storage.write(key: 'token', value: user.token);

      return user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> logout({String? token}) async {
    const storage = FlutterSecureStorage();
    assert(email != null);
    assert(password != null);

    String? _token = token;

    _token ??= await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.logout,
        options: Options(
          headers: {
            'authorization': token,
          },
        ),
      );

      return User.fromJson(response.data["user"]);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
