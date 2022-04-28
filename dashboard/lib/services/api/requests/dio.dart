import 'package:dio/dio.dart';

import '../api.service.dart';

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