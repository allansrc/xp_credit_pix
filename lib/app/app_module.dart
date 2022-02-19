import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'modules/connectivity_check/connectivity_check_module.dart';
import 'modules/home/home_module.dart';
import 'modules/queue_request_module/queue_request_module.dart';
import 'modules/splash/splash_page.dart';
import 'modules/storage/storage_module.dart';
import 'shared/http/custom_dio/custom_dio.dart';
import 'shared/http/interceptors/auth_interceptors.dart';
import 'shared/http/interceptors/domain_interceptors.dart';
import 'shared/http/interceptors/queue_interceptors.dart';
import 'shared/utils/services/delete_pdf_file.dart';
import 'shared/utils/services/storage_capacity_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...storageDI,
    ...authDI,
    ...connectivityDI,
    Bind((i) => CustomDio(
          BaseOptions(),
          AuthInterceptors(),
          DomainInterceptors(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SplashPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
