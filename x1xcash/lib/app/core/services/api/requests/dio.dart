import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:dio/dio.dart';

extension DioExt on ApiService {
  Dio get dio {
    final dioObj = Dio(
      BaseOptions(
        baseUrl: 'https://9079-197-234-223-217.ngrok.io/',
      ),
    );

    return dioObj;
  }
}
