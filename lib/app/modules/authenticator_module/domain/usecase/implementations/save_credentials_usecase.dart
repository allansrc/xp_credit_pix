import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_custom_either/xp_either.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/services/store_local_service_impl.dart';

import '../interfaces/save_credentials_usecase.dart';

class SaveCredentials implements ISaveCredentials {
  final StorageLocalSecureService service;
  SaveCredentials(this.service);
  @override
  Future<XPeither<IFailureError, bool>> call(CredentialsParam credentials) async =>
      await service.put(credentials);
}
