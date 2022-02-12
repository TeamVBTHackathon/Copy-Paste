import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/features/authenticate/register/model/register_request_model.dart';
import 'package:hackathon/features/authenticate/register/service/IRegisterService.dart';

class RegisterViewCubit extends Cubit<RegisterViewState> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  TextEditingController nameController;
  TextEditingController addresController;
  TextEditingController? imageController;
  final GlobalKey<FormState> formKey;
  final IRegisterService service;

  bool isRegisterFail = false;
  bool isLoading = false;

  RegisterViewCubit({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nameController,
    required this.addresController,
    required this.formKey,
    required this.service,
    this.imageController,
  }) : super(RegisterViewInitial());

  void registerUserModel() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      RegisterRequestModel model = RegisterRequestModel(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        city: addresController.text,
        image: imageController?.text,
      );
      service.register(model);
    } else {
      isLoading = !isLoading;
      emit(RegisterLoadingState(isValidate: isLoading));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(RegisterLoadingState(isValidate: isLoading));
  }
}

abstract class RegisterViewState {}

class RegisterViewInitial extends RegisterViewState {}

class RegisterValidateState extends RegisterViewState {
  final bool isValidate;

  RegisterValidateState({required this.isValidate});
}

class RegisterLoadingState extends RegisterViewState {
  final bool isValidate;

  RegisterLoadingState({required this.isValidate});
}
