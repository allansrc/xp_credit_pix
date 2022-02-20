import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../interceptors/authenticator_interceptors.dart';
import '../interceptors/domain_interceptors.dart';

class DioXPAuth with DioMixin implements IHttpService {
  final DomainInterceptors _domainInterceptor;
  final AuthenticatorInterceptors _authInterceptor;

  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter();

  @override
  final BaseOptions options;

  DioXPAuth(this.options, this._domainInterceptor, this._authInterceptor) {
    setupInterceptors();
  }

  @override
  void setupInterceptors() {
    interceptors.add(_domainInterceptor);
    interceptors.add(_authInterceptor);
  }
}

abstract class IHttpService extends DioMixin {
  void setupInterceptors();
}
