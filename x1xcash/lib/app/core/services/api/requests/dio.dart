import 'package:x1xcash/app/core/services/api/api.service.dart';
import 'package:dio/dio.dart';

extension DioExt on ApiService {
  Dio get dio {
    final dioObj = Dio(
      BaseOptions(
        baseUrl: 'https://one-xcash-api.herokuapp.com/',
      ),
    );

    return dioObj;
  }
}
