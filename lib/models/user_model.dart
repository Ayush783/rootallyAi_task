import 'package:firebase_auth/firebase_auth.dart';

//model for storing the user or error in case of failure
class Usermodel {
  final dynamic user;
  final bool error;
  final String errorMessage;

  Usermodel(this.user, this.errorMessage, this.error);

  Usermodel.success(User user)
      : user = user,
        error = false,
        errorMessage = "none";

  Usermodel.failure(String errorMessage)
      : user = null,
        error = true,
        errorMessage = errorMessage;
}
