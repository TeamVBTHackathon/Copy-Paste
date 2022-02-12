import 'package:flutter/material.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/core/init/theme/theme_purple.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  Icon icon;
  TextInputType? textInputType;
  void Function()? onEditingComplete;
  String? errorText;
  bool? isObsecure;
  String Function(String?)? validator;
  bool? isEnabled;
  IconButton? iconButton;

  CustomTextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.icon,
    this.onEditingComplete,
    this.errorText,
    this.isObsecure,
    this.validator,
    this.textInputType,
    this.isEnabled,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.08, vertical: context.height * 0.009),
      child: TextFormField(
        enabled: isEnabled ?? true,
        controller: controller,
        obscureText: isObsecure ?? false,
        validator: validator,
        onEditingComplete: onEditingComplete,
        keyboardType: textInputType,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey.shade100,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent.shade100),
            borderRadius: BorderRadius.circular(context.height * 0.02),
          ),
          labelText: labelText,
          errorText: errorText,
          errorStyle: ThemePurple().theme.textTheme.headline5!.copyWith(
                color: ThemePurple().theme.errorColor,
              ),
          prefixIcon: icon,
          suffixIcon: iconButton,
        ),
      ),
    );
  }
}
