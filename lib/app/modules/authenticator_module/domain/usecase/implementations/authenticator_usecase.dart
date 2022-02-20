import 'package:xp_custom_either/xp_either.dart';
import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/repositories/autheticator_repository.dart';

import '../interfaces/authenticator_usecase.dart';

class AuthenticateUserUsercase extends IAuthenticatorUsecase {
  final IAuthenticatorRepository _repository;
  AuthenticateUserUsercase(this._repository);

  @override
  Future<XPeither<IFailureError, CredentialsResponse>> call(CredentialsParam param) async {
    if (param.clientID.isEmpty || param.securityKey.isEmpty) {
      return FailureResponse(FailureError(message: 'invalid credentials'));
    }
    return await _repository.authemticateUser(param);
  }
}
