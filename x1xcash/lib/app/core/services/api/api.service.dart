import 'package:x1xcash/app/core/services/base.service.dart';
export './auth/auth.dart';

class ApiService extends BaseService {
  final String? password;
  final String? email;

  ApiService({
    this.password,
    this.email,
  });
}
