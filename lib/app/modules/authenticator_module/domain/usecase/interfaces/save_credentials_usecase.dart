import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_custom_either/xp_either.dart';

abstract class ISaveCredentials {
  Future<XPeither<IFailureError, bool>> call(CredentialsParam credentials);
}
