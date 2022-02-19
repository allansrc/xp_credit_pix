import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../interceptors/auth_interceptors.dart';
import '../interceptors/domain_interceptors.dart';
import '../interceptors/queue_interceptors.dart';

// ignore: prefer_mixin
class CustomDio with DioMixin implements IHttpService {
  final AuthInterceptors _authInterceptor;
  final DomainInterceptors _domainInterceptor;
  // ignore: unused_field
  final QueueInterceptors _queueInterceptors;
  // final String url;

  @override
  HttpClientAdapter httpClientAdapter = DefaultHttpClientAdapter()
    // ignore: body_might_complete_normally_nullable
    ..onHttpClientCreate = (client) {
      client.badCertificateCallback = (cert, host, port) => true;
    };

  @override
  final BaseOptions options;

  CustomDio(this.options, this._authInterceptor, this._domainInterceptor, this._queueInterceptors) {
    setupInterceptors();
  }

  @override
  void setupInterceptors() {
    interceptors.add(_authInterceptor);
    interceptors.add(_domainInterceptor);
    // interceptors.add(_queueInterceptors);
  }
}

abstract class IHttpService extends DioMixin {
  void setupInterceptors();
}
