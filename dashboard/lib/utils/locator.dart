import 'package:flutter_web_seo/services/api/api.service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Here you register all your viewmodels
  locator.registerLazySingleton(() => ApiService());
}