import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseUserRepo {
  User? _user;
  User? get user => _user;
  bool get isUserLoggedIn => _user == null;

  setUser(User? newUser) {
    _user = newUser;
  }

  logout(){
    _user=null;
    FirebaseAuth.instance.signOut();
  }
}
