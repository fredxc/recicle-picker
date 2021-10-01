import 'package:firebase_auth/firebase_auth.dart';
import 'package:picker/models/user.dart';

class StateModel {
  FirebaseUser authUser;
  bool isLoading;
  User user;

  StateModel({
    this.isLoading = false,
    this.authUser,
    this.user,
  });
}
