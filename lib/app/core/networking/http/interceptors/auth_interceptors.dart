import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticatorInterceptors extends Interceptor {
  final AuthenticateStore authenticatorStore = Modular.get<AuthenticateStore>();

  AuthenticatorInterceptors();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    final _dio = Modular.get<Dio>();
    if (err.response?.statusCode == 401) {
      var token = await authenticatorStore.token;
      if (token != null &&
          token.isNotEmpty &&
          !(err.requestOptions.path.endsWith(XPApiEndpoints.authLogin))) {
        await authenticatorStore.refreshLogin();
        return _dio.request(
          err.response!.realUri.toString(),
          data: err.response!.data.request.data,
        );
      } else if (err.requestOptions.path.endsWith(XPApiEndpoints.authLogin)) {
        return super.onError(err, handler);
      } else {
        await authenticatorStore.logout();
      }
    }
    return super.onError(err, handler);
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //Instance level
    dio.options.contentType = Headers.formUrlEncodedContentType;
//or works once
    dio.post(
      '/info',
      data: {'id': 5},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    final token = await authenticatorStore.token;
    await authenticatorStore.getCredentialsLocal();
    //final userLogged = authenticatorStore.state;
    final locale = authenticatorStore.getLocale;
    final credentials = authenticatorStore.credentials.login;

    if (token.isNotEmpty) {
      options.headers.addAll({
        'X-Token': '$token',
        'X-Requested-With': 'br.com.acttive.docnix.mobile',
        'X-Idioma': '$locale',
        'X-Login': '$credentials',
        'X-Empresa-Logada': EnviromentVariables().selectedCompany.id
      });
    }
    return super.onRequest(options, handler);
  }
}
