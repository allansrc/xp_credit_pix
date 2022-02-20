import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/storage/local_db_keys.dart';
import 'package:xp_ob/app/core/storage/presenter/interfaces/authenticator_controller_impl.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/params.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/entities/responses.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/usecase/interfaces/get_credentials_usecase.dart';
import 'package:xp_ob/app/modules/authenticator_module/domain/usecase/interfaces/save_credentials_usecase.dart';
import 'package:xp_ob/app/modules/authenticator_module/externals/mappers/response/credentials_response_mapper.dart';

import '../presenter/authenticator_controller.dart';

class AuthenticatorStore extends StreamStore<Exception, CredentialsResponse> {
  final IStorageController _storageController;
  final ISaveCredentials _saveCredentials;
  final IGetCredentials _getCredentials;

  AuthenticatorStore(
    this._storageController,
    this._saveCredentials,
    this._getCredentials,
  ) : super(CredentialsResponse()) {
    getCredentialsFromStorage();
  }

  CredentialsResponse? get tokenReceived => state;

  final _credentials = RxNotifier<CredentialsParam>(CredentialsParam());
  CredentialsParam get credentials => _credentials.value;
  set credentials(CredentialsParam value) => _credentials.value = value;

  final _encryptParam = RxNotifier<String>('');
  String get encryptParam => _encryptParam.value;
  set encryptParam(String value) => _encryptParam.value = value;

  Future<String> get token async {
    await getCredentialsFromStorage();
    return state.tokenType;
  }

  Future<void> getCredentialsFromStorage() async {
    var hasToken = await _storageController.containsKey(LocalDBKeys.token);

    if (hasToken) {
      var result = await _storageController.read(LocalDBKeys.token);
      setTokenReceived(await CredentialsResponseMapper().fromMap(result));
    }
  }

  void setTokenReceived(CredentialsResponse credentialsResponse) {
    update(credentialsResponse);
  }

  saveCredentials(CredentialsParam params) async {
    final result = await _saveCredentials(params);
    result.fold(onFailure: (error) {
      debugPrint('error: $error');
      // TODO:(allansrc) implements snakbar errors
      // showSnackBar(SnackBar(content: Text('${error.message}r')));
    }, onSuccess: (r) {
      debugPrint('it`s ok');
    });
  }

  getCredentialsLocal() async {
    final result = await _getCredentials(encryptParam);
    result.fold(onFailure: (error) {
      debugPrint('error: $error');
      // TODO:(allansrc) implements snakbar errors
      // showSnackBar(SnackBar(content: Text('${error.message}')));
    }, onSuccess: (value) {
      credentials = value;
    });
  }

  Future refreshLogin() async {
    await getCredentialsLocal();
    // ignore: unnecessary_null_comparison
    if (credentials != null) {
      final result = await Modular.get<AuthenticatorController>().authenticatorUsecase(credentials);

      result.fold(
        onFailure: (l) {
          debugPrint('error: $l');
          // TODO(allansrc): implements snackbr
          // asuka.showSnackBar(
          //   SnackBar(
          //     content: Text('${l.message}'),
          //     backgroundColor: Colors.red,
          //     behavior: Platform.isIOS ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
          //   ),
          // );
        },
        onSuccess: (r) async {
          await _storageController.put(LocalDBKeys.token, CredentialsResponseMapper().toMap(r));
        },
      );
    }
  }
}
