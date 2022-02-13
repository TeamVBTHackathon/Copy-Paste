// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hackathon/features/authenticate/login/model/login_request_model.dart';
import 'package:hackathon/features/authenticate/login/service/ILoginService.dart';

class LoginViewModelCubit extends Cubit<LoginViewModelState> {
  TextEditingController emailController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  final ILoginService service;

  bool isLoginFail = false;
  bool isLoading = false;

  LoginViewModelCubit({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.service,
  }) : super(LoginViewModelInitial());

  void postUserModel() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      LoginRequestModel model = LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      );
      service.postUserLogin(model);
    } else {
      isLoading = !isLoading;
      emit(LoginLoadingState(isValidate: isLoading));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isValidate: isLoading));
  }
}

abstract class LoginViewModelState {}

class LoginViewModelInitial extends LoginViewModelState {}

class LoginValidateState extends LoginViewModelState {
  final bool isValidate;

  LoginValidateState({required this.isValidate});
}

class LoginLoadingState extends LoginViewModelState {
  final bool isValidate;

  LoginLoadingState({required this.isValidate});
}
