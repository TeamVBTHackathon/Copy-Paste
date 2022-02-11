import 'package:hackathon/features/authenticate/login/model/login_request_model.dart';
import 'package:hackathon/features/authenticate/login/model/login_response_model.dart';

abstract class ILoginService {
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return '/login';

      default:
        return '/';
    }
  }
}
