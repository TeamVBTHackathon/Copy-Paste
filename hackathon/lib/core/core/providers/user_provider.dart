import 'package:flutter/material.dart';
import 'package:hackathon/core/core/model/user_model.dart';
import 'package:hackathon/core/core/service/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  final AuthMethod _authMethod = AuthMethod();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethod.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
