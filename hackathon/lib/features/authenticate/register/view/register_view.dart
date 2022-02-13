library register_view;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hackathon/core/extension/context_extension.dart';
import 'package:hackathon/features/authenticate/register/model_view/register_view_model.dart';
import 'package:hackathon/features/authenticate/register/service/register_service.dart';
import 'package:hackathon/features/authenticate/widgets/animation_widget.dart';
import 'package:hackathon/features/authenticate/widgets/custom_text_form_field_widget.dart';
import 'package:hackathon/features/homepage/view/home_page_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../../navbar/navbar.dart';

part 'parts/register_view_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);
  static const routeName = '/register-view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimationWidget(
            querterTurns: 4,
          ),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(top: context.height * 0.1),
            child: RegisterViewBody(),
          )),
        ],
      ),
    );
  }
}
