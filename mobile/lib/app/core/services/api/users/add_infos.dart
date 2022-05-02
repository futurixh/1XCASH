import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:x1xcash/app/core/models/transaction.model.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:x1xcash/app/core/services/api/requests/endpoints.dart';
import '../auth/auth.dart';
import '../requests/dio.dart';

extension Infos on ApiService {
  Future<dynamic> uploadInfos({
    required String userId,
    required File rccm,
    required File ifu,
    required File identity,
  }) async {
    String token = await getBearerToken();

    try {
      final formData = FormData.fromMap({
        'userId': userId,
        'ifu': await MultipartFile.fromFile(ifu.path),
        'rccm': await MultipartFile.fromFile(rccm.path),
        'identity': await MultipartFile.fromFile(identity.path),
      });
      final res = await dio
          .post(
            Endpoints.uploadFiles,
            options: Options(
              headers: {
                'Authorization': token,
                'Content-Type': 'application/json',
              },
            ),
            data: formData,
          )
          .then(
            (value) => log(value.toString()),
          );
      return res;
    } catch (e) {
      log(e.toString());
    }
  }
}
