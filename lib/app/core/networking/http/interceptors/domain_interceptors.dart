import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../modules/auth/stores/auth_store.dart';
import '../../enviroment_variables/enviroment_variables.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class DomainInterceptors extends Interceptor {
  final AuthStore authStore = Modular.get<AuthStore>();

  DomainInterceptors();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = EnviromentVariables().urlDomain;
    return super.onRequest(options, handler);
  }
}
