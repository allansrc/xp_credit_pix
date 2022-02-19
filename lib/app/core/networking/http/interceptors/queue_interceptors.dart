import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../modules/auth/stores/auth_store.dart';
import '../../../modules/connectivity_check/presenter/check_connection_controller.dart';
import '../../../modules/storage/presenter/storage_controller.dart';
import 'auth_interceptors.dart';

class QueueInterceptors extends Interceptor {
  final AuthStore authStore = Modular.get<AuthStore>();
  final dio = Dio();
  final StorageController storageController = Modular.get<StorageController>();
  final CheckConnectionController checkConnection = Modular.get<CheckConnectionController>();
  List listRequests = [];
  var keyRequests;

  QueueInterceptors();

  Future<void> init() async {
    keyRequests = 'USER-${'${authStore.userLogged.user?.id}'}-REQUESTS-LIST-KEY';
    if (await storageController.containsKey(keyRequests)) {
      var map = await storageController.read(keyRequests);
      listRequests = map['list'];
    }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }

  var listRequestsRemove = [];
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await init();

    var isUrl = !options.uri.toString().contains('/login') &&
        !options.uri.toString().contains('/ping') &&
        !options.uri.toString().contains('/empresa');

    var hasConnection = await checkConnection.checkConnection();

    if (options.method == 'POST' && !hasConnection && isUrl) {
      
      listRequests.add(RequestItem(
              uri: options.uri.toString(),
              contentType: options.contentType,
              data: options.data,
              extra: options.extra,
              headers: options.headers,
              method: options.method)
          .toMap());
      storageController.put(keyRequests, {'list': listRequests});
    }

    var hasSync = listRequests.isNotEmpty &&
        hasConnection &&
        (authStore.userLogged.user?.login != null && authStore.userLogged.user!.login.isNotEmpty) &&
        isUrl;

    if (hasSync) {
      try {
        dio.interceptors.add(AuthInterceptors());

        // ignore: avoid_function_literals_in_foreach_calls
        // listRequests.forEach((item) async {
        //   // super.onRequest((item['err'] as DioError).requestOptions, handler);
        //   final _options = RequestItem.fromMap(item);
        //   await dio
        //       .request(_options.uri,
        //           data: _options.data,
        //           options: Options(
        //               contentType: _options.contentType,
        //               extra: _options.extra,
        //               method: _options.method,
        //               headers: _options.headers))
        //       .then((value) {
        //     listRequestsRemove.add(item);
        //   });
        // });

        for (var item in listRequests) {
          final _options = RequestItem.fromMap(item);
          _options.headers?['X-Token'] = await authStore.token;
          try {
            await dio
                .request(_options.uri,
                    data: _options.data,
                    options: Options(
                        contentType: _options.contentType, extra: _options.extra, method: _options.method, headers: _options.headers))
                .then((value) {
              listRequestsRemove.add(item);
            });
          } on DioError catch (e) {
            if (e.error == 'Http status error [500]') {
              listRequestsRemove.add(item);
            }
            debugPrint(e.toString());
          }
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    await storageController.put(keyRequests, {'list': listRequests..removeWhere((element) => listRequestsRemove.contains(element))});
    listRequestsRemove.clear();
    return super.onRequest(options, handler);
  }
}

class RequestItem {
  final String uri;
  final dynamic data;
  final String? contentType;
  final Map<String, dynamic>? extra;
  final String? method;
  final Map<String, dynamic>? headers;

  RequestItem({
    required this.uri,
    this.data,
    this.contentType,
    this.extra,
    this.method,
    this.headers,
  });

  Map<String, dynamic> toMap() {
    return {
      'uri': uri,
      'data': data,
      'contentType': contentType,
      'extra': extra,
      'method': method,
      'headers': headers,
    };
  }

  factory RequestItem.fromMap(Map map) {
    return RequestItem(
      uri: map['uri'],
      data: map['data'] ?? null,
      contentType: map['contentType'],
      extra: Map<String, dynamic>.from(map['extra']),
      method: map['method'],
      headers: Map<String, dynamic>.from(map['headers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestItem.fromJson(String source) => RequestItem.fromMap(json.decode(source));
}
