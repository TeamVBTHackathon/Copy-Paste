import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/core/core/service/storage_service.dart';
import 'package:hackathon/features/authenticate/register/model/register_response_model.dart';
import 'package:hackathon/features/authenticate/register/model/register_request_model.dart';
import 'package:hackathon/features/authenticate/register/service/IRegisterService.dart';

class RegisterService extends IRegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StorageService _storageService = StorageService();
  @override
  Future<RegisterResponseModel?> register(RegisterRequestModel model) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: model.email, password: model.password);
      String imageUrl;

      imageUrl =
          await _storageService.uploadMedia(File(model.pickedFile?.path ?? ''));

      await _firestore.collection('users').doc(user.user!.uid).set({
        'email': model.email,
        'name': model.name,
        'imageUrl': imageUrl,
        'city': model.city,
      });
      return RegisterResponseModel(
        user: user.user!,
      );
    } on FirebaseAuthException catch (e) {
      rethrow;
    }
  }
}
