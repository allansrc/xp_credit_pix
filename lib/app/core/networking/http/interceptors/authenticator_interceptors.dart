import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/networking/core.credentials.dart';
import 'package:xp_ob/app/core/networking/xp_api_endpoints.dart';
import 'package:xp_ob/app/modules/authenticator_module/store/authenticator_store.dart';

class AuthenticatorInterceptors extends Interceptor {
  final AuthenticatorStore authenticatorStore = Modular.get<AuthenticatorStore>();

  AuthenticatorInterceptors();

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (err.requestOptions.path.endsWith(XPAPIEndpoints.accessToken)) {
        return super.onError(err, handler);
      } else {
        return super.onError(err, handler);
      }
    }
    return super.onError(err, handler);
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final _dio = Modular.get<Dio>();
    var responseAccessToken;

    final token = await authenticatorStore.token;
    await authenticatorStore.getCredentialsLocal();
    final credentials = authenticatorStore.credentials;
    if (token.isEmpty ||
        (credentials.accessToken.isEmpty &&
            credentials.clientID.isEmpty &&
            credentials.securityKey.isEmpty)) {
      _dio.options.contentType = Headers.formUrlEncodedContentType;

      responseAccessToken = await _dio.post(
        XPAPIEndpoints.accessToken,
        data: {
          'grant_type': 'client_credentials',
          'client_id': CoreCredentials.clientID,
          'client_secret': CoreCredentials.secretKey,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            // 'User-Agent': 'ReqBin Curl Client/1.0',
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
          },
        ),
      );
    }

    // if (token.isNotEmpty) {
    //   options.headers.addAll({
    //     'X-Token': '$token',
    //     'X-Requested-With': 'br.com.acttive.docnix.mobile',
    //     'X-Idioma': '$locale',
    //     'X-Login': '$credentials',
    //     'X-Empresa-Logada': EnviromentVariables().selectedCompany.id
    //   });
    // }
    return super.onRequest(options, handler);
  }
}
