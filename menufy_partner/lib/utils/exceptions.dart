class ExceptionMessages {
  static const verifyEmailFirst =
      "A verification link has been sent to your mail,please verify your email first!";
}

class VerifyEmailException implements Exception {
  VerifyEmailException();
  String get error => ExceptionMessages.verifyEmailFirst;
}
