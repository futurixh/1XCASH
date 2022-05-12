import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
      return users;
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
    return users;
  }

  Future<User?> getUser(String id) async {
    String token = await getBearerToken();

    try {
      final response = await dio.get(
        Endpoints.getUser + id,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      final user = User.fromJson(response.data["user"]);
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
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
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
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
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
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
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
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
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }

  Future<User?> createUser(String lastname, String firstname, String email, String telephone, String password, String role, PlatformFile? ifuFile, PlatformFile? identityFile, PlatformFile? rccmFile) async {
    String token = await getBearerToken();
    var formData = FormData.fromMap({
      "lastname": lastname,
      "firstname": firstname,
      "email": email,
      "telephone": telephone,
      "password": password,
      "role": role,
    });

    if (ifuFile != null) {
      formData.files.add(MapEntry('ifu', MultipartFile.fromBytes(ifuFile.bytes as List<int>, filename: ifuFile.name)));
    }
    if (identityFile != null) {
      formData.files.add(MapEntry('identity', MultipartFile.fromBytes(identityFile.bytes as List<int>, filename: identityFile.name)));
    }
    if (rccmFile != null) {
      formData.files.add(MapEntry('rccm', MultipartFile.fromBytes(rccmFile.bytes as List<int>, filename: rccmFile.name)));
    }

    try {
      final response = await dio.post(
        Endpoints.createUser,
        data: formData,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      final user = User.fromJson(response.data["user"]);
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
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
        }
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return null;
  }

  Future<User?> editUser(String id, String lastname, String firstname, String email, String telephone, String role, PlatformFile? ifuFile, PlatformFile? identityFile, PlatformFile? rccmFile) async {
    String token = await getBearerToken();
    var formData = FormData.fromMap({
      "lastname": lastname,
      "firstname": firstname,
      "email": email,
      "telephone": telephone,
      "role": role,
    });

    if (ifuFile != null) {
      formData.files.add(MapEntry('ifu', MultipartFile.fromBytes(ifuFile.bytes as List<int>, filename: ifuFile.name)));
    }
    if (identityFile != null) {
      formData.files.add(MapEntry('identity', MultipartFile.fromBytes(identityFile.bytes as List<int>, filename: identityFile.name)));
    }
    if (rccmFile != null) {
      formData.files.add(MapEntry('rccm', MultipartFile.fromBytes(rccmFile.bytes as List<int>, filename: rccmFile.name)));
    }

    try {
      final response = await dio.put(
        Endpoints.editUser + id,
        data: formData,
        options: Options(
          headers: {
            'Authorization': token,
            'Content-Type': 'application/json',
          },
        ),
      );
      final user = User.fromJson(response.data["user"]);
      EasyLoading.showSuccess("Succès", duration: const Duration(seconds: 3));
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