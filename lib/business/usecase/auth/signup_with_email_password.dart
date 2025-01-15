import 'package:dartz/dartz.dart';

import '../../../data/models/user_request.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth.dart';
import '../usecase.dart';

class SignupWithEmailPasswordUseCase implements UseCase<Either,UserRequest>{
  @override
  Future<Either> call({UserRequest? params}) async {
    return await sL<AuthRepository>().SignupWithEmailPassword(params!);
  }


}