import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/networking/xp_api_endpoints.dart';
import 'package:xp_ob/app/modules/authenticator_module/store/authenticator_store.dart';

class DomainInterceptors extends Interceptor {
  final AuthenticatorStore authStore = Modular.get<AuthenticatorStore>();

  DomainInterceptors();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = XPAPIEndpoints.baseUrl;
    return super.onRequest(options, handler);
  }
}
