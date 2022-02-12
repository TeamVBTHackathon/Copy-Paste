import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon/features/authenticate/login/model/login_response_model.dart';
import 'package:hackathon/features/authenticate/login/model/login_request_model.dart';
import 'package:hackathon/features/authenticate/login/service/ILoginService.dart';

class LoginService extends ILoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    try {
      print("Kayıt ediliyor");
      await _auth.signInWithEmailAndPassword(
          email: model.email, password: model.password);
    } catch (e) {
      print("Kayıtta hata var");
    }
  }
}
