import 'package:x1xcash/app/core/services/api/api.service.dart';

void main(List<String> args) async {
  const String email = 'junior.medehou@gmail.com';
  const String password = 'Zanarkand';

  final api = ApiService(
    phone: email,
    password: password,
  );

  await api.login().then((value) => print(value!.toJson().toString()));
}
