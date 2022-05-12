import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../models/user.model.dart';

class AuthMiddleware extends QMiddleware {
  @override
  Future<String?> redirectGuard(String path) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    if (token == null) {
      return '/login';
    }

    return null;
  }
}

class LoginMiddleware extends QMiddleware {
  @override
  Future<String?> redirectGuard(String path) async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    if (token != null) {
      return '';
    }

    return null;
  }
}