import 'package:xp_custom_either/xp_either.dart';
import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';

abstract class IAuthenticatorRepository {
  Future<XPeither<IFailureError, CredentialsResponse>> authemticateUser(CredentialsParam param);
}
