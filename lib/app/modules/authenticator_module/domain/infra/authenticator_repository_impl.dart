import 'package:xp_ob/app/modules/authenticator_module/domain/datasources/authenticator_datasource.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/core/contracts/errors/failure_error.dart';
import '../repositories/autheticator_repository.dart';
import 'package:xp_custom_either/xp_either.dart';

class AuthenticatorRepository implements IAuthenticatorRepository {
  final IAuthenticatorDatasource _datasource;

  AuthenticatorRepository(this._datasource);

  @override
  Future<XPeither<IFailureError, CredentialsResponse>> authemticateUser(
      CredentialsParam param) async {
    return await authenticateUserExternal(param);
  }

  Future<XPeither<IFailureError, CredentialsResponse>> authenticateUserExternal(
      CredentialsParam param) async {
    try {
      var response = await _datasource(param);
      return SuccessResponse(response);
    } on IFailureError catch (e) {
      return FailureResponse(FailureError(message: '${e.message}'));
    } catch (e) {
      return FailureResponse(FailureError(message: '$e'));
    }
  }
}
