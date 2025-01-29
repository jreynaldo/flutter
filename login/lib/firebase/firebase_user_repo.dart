import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/firebase/user_repo.dart';
import 'models/user.dart';
import 'user_repo.dart';

class FirebaseUserRepo extends UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('user');

  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  // TODO: implement user
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser;
    });
  }

  @override
  Future<void> setUserData(MyUser myUser) async{
    try {
       await userCollection
             .doc(myUser.userId)
             .set(myUser.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> sigIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      var user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      return myUser.copyWith(userId: user.user?.uid);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
