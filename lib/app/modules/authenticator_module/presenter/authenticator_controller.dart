import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';

import 'package:flutter_triple/flutter_triple.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/usecase/interfaces/authenticator_usecase.dart';

class AuthenticatorController extends StreamStore<IFailureError, CredentialsParam> {
  AuthenticatorController(
    this.authenticatorUsecase,
  ) : super(CredentialsParam());

  final IAuthenticatorUsecase authenticatorUsecase;
}
