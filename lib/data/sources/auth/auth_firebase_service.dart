

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';
import '../../models/user_request.dart';

abstract class AuthFirebaseService{
  Future<Either> SigninWithEmailPassword(UserRequest user);
  Future<Either> SignupWithEmailPassword(UserRequest user);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> SigninWithEmailPassword(UserRequest user)async {

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: user.password);

      return const Right("Signin was sucessful");
    }on FirebaseAuthException catch (e){
      String message ='';
      switch (e.code) {
        case 'invalid-email':
          message= 'The email address is not valid.';
          break;
        case 'user-not-found':
          message= 'No user found with this email address.';
          break;
        case 'wrong-password':
          message= 'The password is incorrect.';
          break;
        case 'user-disabled':
          message= 'This user account has been disabled.';
          break;
        case 'too-many-requests':
          message= 'Too many unsuccessful attempts. Please try again later.';
          break;
        case 'network-request-failed':
          message= 'Network error occurred. Please check your connection.';
          break;
        default:
          message= 'An error occurred: ${e.message}';
          break;
      }
      return Left(message);

    }

  }

  @override
  Future<Either> SignupWithEmailPassword(UserRequest user) async {
    try{
      var data=  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);
      UserModel userModel=UserModel(email: data.user!.email!);
      FirebaseFirestore.instance.collection("Users").doc(data.user?.email).
      set(userModel.toJson());

      return const Right('Signup was successful');
    } on FirebaseAuthException catch (e){

      String message='';
      switch (e.code) {
        case 'invalid-email':
          message= 'The email address is not valid.';
          break ;
        case 'email-already-in-use':
          message='An account already exist with that email';
          break ;
        case 'weak-password':
          message="The password provided is too weak";
          break ;

        case 'network-request-failed':
          message='Network error occurred. Please check your connection.';
          break ;
        default:
          message= 'An error occurred: ${e.message}';
          break ;
      }
      return Left(message);

    }
  }

}