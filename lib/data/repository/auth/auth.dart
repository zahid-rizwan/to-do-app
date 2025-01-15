
import 'package:dartz/dartz.dart';

import '../../../business/repository/auth/auth.dart';
import '../../../service_locator.dart';
import '../../models/user_request.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> SigninWithEmailPassword(UserRequest loginUserReq) async {
    return await sL<AuthFirebaseService>().SigninWithEmailPassword(loginUserReq);
  }

  @override
  Future<Either> SignupWithEmailPassword(UserRequest createUserReq) async {
    return sL<AuthFirebaseService>().SignupWithEmailPassword(createUserReq);

  }


}