import 'package:xp_ob/app/core/storage/presenter/interfaces/authenticator_controller_impl.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthenticatorStore extends StreamStore<Exception, LoginResponse> {
  final IStorageController _storageController;
  final ISaveCredentials _saveCredentials;
  // ignore: unused_field
  final IDeleteCredentials _deleteCredentials;
  final IGetCredentials _getCredentials;
  var modular;

  AuthStore(this._storageController, this._saveCredentials,
      this._deleteCredentials, this._getCredentials,
      {this.modular})
      : super(LoginResponse()) {
    if (modular == null) {
      modular = Modular;
    }
    getLoggedUserFromStorage();
  }

  LoginResponse get userLogged => state;

  final _credentials = RxNotifier<LoginParam>(LoginParam());
  LoginParam get credentials => _credentials.value;
  set credentials(LoginParam value) => _credentials.value = value;

  final _encryptParam = RxNotifier<String>('');
  String get encryptParam => _encryptParam.value;
  set encryptParam(String value) => _encryptParam.value = value;

  Future<String> get token async {
    await getLoggedUserFromStorage();
    return state.user?.token ?? '';
  }

  String get getLocale => Platform.localeName.split('0')[0];

  Future<void> getLoggedUserFromStorage() async {
    var hasUser =
        await _storageController.containsKey(LocalDbKeys.loggedUserKey);

    if (hasUser) {
      var result = await _storageController.read(LocalDbKeys.loggedUserKey);
      setLoggedUser(await LoginResponseMapper().fromMap(result));
    }
  }

  void setLoggedUser(LoginResponse loginResponse) {
    update(loginResponse);
  }

  Future saveActivationCode(String activationCode) async {
    try {
      await _storageController
          .put(LocalDbKeys.activationCodeKey, {'code': activationCode});
      return true;
    } catch (e) {
      throw SaveLocalActivationCode(message: 'failed_to_save'.i18n());
    }
  }

  Future getActivationCode() async {
    var hasCode =
        await _storageController.containsKey(LocalDbKeys.activationCodeKey);

    if (hasCode) {
      try {
        var result =
            await _storageController.read(LocalDbKeys.activationCodeKey);
        return result['code'] ?? '';
      } catch (e) {
        throw SaveLocalActivationCode(message: 'failed_to_save'.i18n());
      }
    } else {
      return '';
    }
  }

  Future saveIpDomainUrl(String ipDomain) async {
    try {
      await _storageController.put(LocalDbKeys.ipDomainKey, {'code': ipDomain});
      return true;
    } catch (e) {
      throw SaveLocalActivationCode(message: 'failed_to_save'.i18n());
    }
  }

  Future getIpDomainUrl() async {
    //await _storageController.clear();
    var hasCode = await _storageController.containsKey(LocalDbKeys.ipDomainKey);

    if (hasCode) {
      try {
        var result = await _storageController.read(LocalDbKeys.ipDomainKey);

        if (result['code']
            .toString()
            .endsWith('https://corporate.docnix.com.br/corporate/mobile')) {
          return '';
        }
        return result['code'] ?? '';
      } catch (e) {
        throw SaveLocalActivationCode(message: 'failed_to_save'.i18n());
      }
    } else {
      return '';
    }
  }

  saveCredentials(LoginParam params) async {
    final result = await _saveCredentials(params);
    // ignore: avoid_print
    result.fold(onFailure: (error) {
      debugPrint('error: $error');
      asuka.showSnackBar(SnackBar(content: Text('${error.message}r')));
    }, onSuccess: (r) {
      debugPrint('Deu Bão');
    });
  }

  getCredentialsLocal() async {
    final result = await _getCredentials(encryptParam);
    result.fold(onFailure: (error) {
      debugPrint('error: $error');
      logout();
      asuka.showSnackBar(SnackBar(content: Text('${error.message}')));
    }, onSuccess: (value) {
      credentials = value;
    });
  }

  logout() async {
    await modular.get<LoginController>().logout(LogoutParam());
    await _storageController.delete(LocalDbKeys.loggedUserKey);
    //await _deleteCredentials(encryptParam);
    //await _storageController.clear();
    update(LoginResponse());
    encryptParam = '';
    credentials = LoginParam();
    await saveIpDomainUrl(EnviromentVariables().urlDomain);
    Modular.to.navigate('/');
  }

  Future refreshLogin() async {
    await getCredentialsLocal();
    // ignore: unnecessary_null_comparison
    if (credentials != null) {
      final result = await Modular.get<LoginController>()
          .autenthicateUserUsercase(credentials);

      result.fold(
        onFailure: (l) {
          asuka.showSnackBar(
            SnackBar(
              content: Text('${l.message}'),
              backgroundColor: Colors.red,
              behavior: Platform.isIOS
                  ? SnackBarBehavior.floating
                  : SnackBarBehavior.fixed,
            ),
          );
          logout();
        },
        onSuccess: (r) async {
          await _storageController.put(
              LocalDbKeys.loggedUserKey, LoginResponseMapper().toMap(r));
        },
      );
    } else {
      logout();
    }
  }
}
