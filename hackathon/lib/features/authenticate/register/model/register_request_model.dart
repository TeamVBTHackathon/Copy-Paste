import 'package:image_picker/image_picker.dart';

class RegisterRequestModel {
  String name;
  String email;
  String password;
  String city;
  String? image;
  XFile? pickedFile;

  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.city,
    this.pickedFile,
    this.image,
  });
}
