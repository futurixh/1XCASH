import 'package:dio/dio.dart';

import '../api.service.dart';

extension DioExt on ApiService {
  Dio get dio {
    final dioObj = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:5500/',
/*        baseUrl: 'https://one-xcash-api.herokuapp.com/',*/
      ),
    );

    return dioObj;
  }
}