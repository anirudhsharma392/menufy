import 'package:firebase_auth/firebase_auth.dart';
import 'package:menufy_partner/utils/exceptions.dart';

class AuthenticationAPI {
     final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User?> signInWithEmailAndPassword(
      String userName, String password) async {
    UserCredential _cred = await _auth.signInWithEmailAndPassword(
        email: userName, password: password);

    //if email is not verified
    if (!_cred.user!.emailVerified) {
      //show verify email first message here
      throw VerifyEmailException();
    } else {
      return _cred.user;
    }
  }




}
