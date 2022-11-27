import 'package:firebase_auth/firebase_auth.dart';

class FirebasePhoneAuth {
  final void Function(UserCredential cred) onSuccessCallback;
  final void Function(FirebaseAuthException e) onErrorCallback;

  FirebasePhoneAuth(
      {required this.onSuccessCallback, required this.onErrorCallback});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _phone = '';
  String _countryCode = '+91';
  String get phoneNumber => _countryCode + _phone;

  String _verificationId = '';
  int? _resendToken;

  setCountryCode(String val) {
    _countryCode = val;
  }

  setPhone(String val) {
    _phone = val;
  }



  submitOTP(otp) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: otp);

    // Sign the user in (or link) with the credential
    await _signIn(credential);
  }

  Future signInWithSMS() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onSMSVerificationFailed,
      codeSent: _onCodeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  resendSMS() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: _resendToken,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onSMSVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential credential) async {
    // ANDROID ONLY!
    // Sign the user in (or link) with the auto-generated credential
    await _signIn(credential);
  }

  _onSMSVerificationFailed(FirebaseAuthException e) {
    onErrorCallback(e);
  }

  _onCodeSent(String verificationId, int? resendToken) async {
    _resendToken = resendToken;
    _verificationId = verificationId;
    // Update the UI - wait for the user to enter the SMS code
  }

  _codeAutoRetrievalTimeout(String verificationId) {}

  _signIn(PhoneAuthCredential credential) async {
    // Sign the user in (or link) with the credential
    UserCredential cred = await _auth.signInWithCredential(credential);
    onSuccessCallback(cred);
  }
}
