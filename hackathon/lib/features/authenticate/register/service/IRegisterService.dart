import 'package:hackathon/features/authenticate/register/model/register_request_model.dart';
import 'package:hackathon/features/authenticate/register/model/register_response_model.dart';

abstract class IRegisterService {
  Future<RegisterResponseModel?> register(RegisterRequestModel model);
}

enum IRegisterServicePath { REGISTER }

extension IRegisterServicePathExtension on IRegisterServicePath {
  String get path {
    switch (this) {
      case IRegisterServicePath.REGISTER:
        return '/register';
      default:
        return '/';
    }
  }
}
