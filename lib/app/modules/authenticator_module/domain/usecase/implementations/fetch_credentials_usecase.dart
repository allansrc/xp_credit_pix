import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_custom_either/xp_either.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/services/store_local_service_impl.dart';

import '../interfaces/fetch_credentials_usecase.dart';

class FetchCredentials implements IFetchCredentials {
  // TODO(allansrc): implements network fetch
  final StorageLocalSecureService service;
  FetchCredentials(this.service);
  @override
  Future<XPeither<IFailureError, CredentialsParam>> call(String encryptParams) async {
    return await service.getParams(encryptParams);
  }
}
