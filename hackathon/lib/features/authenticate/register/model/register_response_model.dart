import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterResponseModel {
  User user;
  RegisterResponseModel({
    required this.user,
  });
}
