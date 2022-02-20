import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_custom_either/xp_either.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/services/store_local_service_impl.dart';

import '../interfaces/get_credentials_usecase.dart';

class GetCredentials implements IGetCredentials {
  final StorageLocalSecureService service;
  GetCredentials(this.service);
  @override
  Future<XPeither<IFailureError, CredentialsParam>> call(String encryptParams) async {
    return await service.getParams(encryptParams);
  }
}
