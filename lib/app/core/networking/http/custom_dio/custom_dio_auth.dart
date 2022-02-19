import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../interceptors/auth_interceptors.dart';
import '../interceptors/domain_interceptors.dart';

class CustomDioAuth with DioMixin implements IHttpService {
  final DomainInterceptors _domainInterceptor;
  final AuthInterceptors _authInterceptor;

  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter();

  @override
  final BaseOptions options;

  CustomDioAuth(this.options, this._domainInterceptor, this._authInterceptor) {
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
