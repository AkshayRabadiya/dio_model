

import '../Api/api.dart';


class UserRepository {
  ///Fetch api login
  static Future<LoginModel> login({
    required String email,
    required String password,
    required String dt,
    required String deviceType,
  }) async {
    final Map<String, dynamic> params = {
      "dt": dt,
      "email": email,
      "password": password,
      "devicetype":deviceType
    };
    final response = await Api.requestLogin(params);
    return response;
  }
}
