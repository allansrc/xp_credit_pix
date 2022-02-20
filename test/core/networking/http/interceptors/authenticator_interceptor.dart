import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xp_ob/app/core/networking/core.credentials.dart';
import 'package:xp_ob/app/core/networking/xp_api_endpoints.dart';

void main(List<String> args) {
  var _dio = Dio();

  void worstTest() async {
    _dio.options.contentType = Headers.formUrlEncodedContentType;

    final responseAccessToken = await _dio.post(
      'https://openapi.xpi.com.br/oauth2/v1/access-token',
      data: {
        'grant_type': 'client_credentials',
        'client_id': CoreCredentials.clientID,
        'client_secret': CoreCredentials.secretKey,
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        // headers: {
        //   // 'User-Agent': 'ReqBin Curl Client/1.0',
        //   'Content-Type': 'application/x-www-form-urlencoded',
        //   'Accept': '*/*',
        //   'Accept-Encoding': 'gzip, deflate, br',
        //   'Connection': 'keep-alive',
        // },
      ),
    );

    debugPrint(responseAccessToken.toString());
  }

  worstTest();
}
