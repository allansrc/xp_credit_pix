import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/errors/failure_error.dart';
import 'package:xp_custom_either/xp_either.dart';

abstract class StorageLocalSecureService {
  Future<XPeither<IFailureError, CredentialsParam>> getParams(
      String encryptParams);
  Future<XPeither<IFailureError, bool>> put(CredentialsParam credentials);
  Future<XPeither<IFailureError, bool>> delete(String encryptParams);
}
