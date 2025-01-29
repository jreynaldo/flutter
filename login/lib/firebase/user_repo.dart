import 'package:firebase_auth/firebase_auth.dart';

import 'models/models.dart';

abstract class UserRepository{
  Stream<User?> get user;
  Future<MyUser> signUp(MyUser myUser,  String password);
  Future<void> setUserData(MyUser myUser);
  Future<void> sigIn(String email, String password);

}