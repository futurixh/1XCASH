import 'package:x1xcash/app/core/services/base.service.dart';
export './auth/auth.dart';
export './wallets/wallets.dart';
export './code/code.dart';
export './transactions/transactions.dart';
export './users/add_infos.dart';

class ApiService extends BaseService {
  String? password;
  String? phone;

  ApiService({
    this.password,
    this.phone,
  });
}
