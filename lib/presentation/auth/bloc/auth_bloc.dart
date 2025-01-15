
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo/business/usecase/auth/signin_with_email_password.dart';

import 'package:todo/core/configs/constants/status.dart';
import 'package:todo/data/sources/user_prefrence/user_prefrence.dart';
import 'package:todo/presentation/home/pages/home.dart';

import '../../../../business/usecase/auth/signup_with_email_password.dart';
import '../../../../service_locator.dart';
import '../../../data/models/user_request.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(): super(const AuthState()){
   on<SignUpWithEmailAndPassword>(_signUpWithEmailPassword);
   on<SignInWithEmailAndPassword>(_signInWithEmailPassword);
  }

  void _signUpWithEmailPassword(SignUpWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result= await sL<SignupWithEmailPasswordUseCase>().call(
        params: UserRequest(
            email: event.email,
            password:event.password));
    result.fold(
            (l){
              ScaffoldMessenger.of(event.context).showSnackBar(
                  SnackBar(content: Text(l),
                    backgroundColor: Colors.red,));
         emit(state.copyWith(status: Status.error,message: l));
        },
            (r){
              Navigator.pushAndRemoveUntil(event.context,
                  MaterialPageRoute(builder: (_)=>HomePage()),
                      (route) => false);
          emit(state.copyWith(status: Status.sucess));
              UserPrefrences().setLoginKey(true);
              UserPrefrences().saveUser(event.email);
        }
    );
  }

  void _signInWithEmailPassword(SignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result= await sL<SigninWithEmailPasswordUseCase>().call(
        params: UserRequest(
            email: event.email,
            password:event.password));
    result.fold(
            (l){
          emit(state.copyWith(status: Status.error,message: l));
          ScaffoldMessenger.of(event.context).showSnackBar(
              SnackBar(content: Text(l),
                backgroundColor: Colors.red,));
        },
            (r){
              Navigator.pushAndRemoveUntil(event.context,
                  MaterialPageRoute(builder: (_)=>HomePage()),
                      (route) => false);
          emit(state.copyWith(status: Status.sucess));
          UserPrefrences().setLoginKey(true);
          UserPrefrences().saveUser(event.email);
        }
    );
  }
}
