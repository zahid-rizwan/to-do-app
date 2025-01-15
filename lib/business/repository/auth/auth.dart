import 'package:dartz/dartz.dart';

import '../../../data/models/user_request.dart';

abstract class AuthRepository{
  Future<Either> SigninWithEmailPassword(UserRequest loginUserReq);
  Future<Either> SignupWithEmailPassword(UserRequest createUserReq);

}