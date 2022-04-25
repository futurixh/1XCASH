import 'package:get_it/get_it.dart';
import 'package:x1xcash/app/core/services/api/api.service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Here you register all your viewmodels
  locator.registerLazySingleton(() => ApiService());
}
