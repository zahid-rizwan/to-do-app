part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final String message;


  const AuthState({
    this.message='',
    this.status=Status.initial
  });


  AuthState copyWith({String? message, Status? status}){
  return AuthState(
    message: message?? this.message,
    status: status?? this.status
  );
  }
  @override
  List<Object?> get props => [status,message];

}

