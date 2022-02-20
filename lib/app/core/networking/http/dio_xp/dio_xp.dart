import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/authenticator_interceptors.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/domain_interceptors.dart';

class DioXP with DioMixin implements IHttpService {
  final AuthenticatorInterceptors _authInterceptor;
  final DomainInterceptors _domainInterceptor;

  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter()
    ..onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
    };

  @override
  final BaseOptions options;

  DioXP(
    this.options,
    this._authInterceptor,
    this._domainInterceptor,
  ) {
    setupInterceptors();
  }

  @override
  void setupInterceptors() {
    interceptors.add(_authInterceptor);
    interceptors.add(_domainInterceptor);
  }
}

abstract class IHttpService extends DioMixin {
  void setupInterceptors();
}
