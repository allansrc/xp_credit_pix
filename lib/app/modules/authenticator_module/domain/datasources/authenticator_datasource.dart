import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';

abstract class IAuthenticatorDatasource {
  Future<CredentialsResponse> call(CredentialsParam param);
}
