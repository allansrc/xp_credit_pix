import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/app_page.dart';
import 'package:xp_ob/app/core/networking/http/dio_xp/dio_xp.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/authenticator_interceptors.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/domain_interceptors.dart';
import 'package:xp_ob/app/modules/authenticator_module/authenticator_module.dart';
import 'package:xp_ob/app/modules/home_module/home_module.dart';

import 'modules/investor_module/investor_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    // ...storageDI,
    // ...authDI,
    // ...connectivityDI,
    Bind((i) => DioXP(
          BaseOptions(),
          AuthenticatorInterceptors(),
          DomainInterceptors(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AppPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/investor', module: InvestorModule()),
    ModuleRoute('/authenticator', module: AuthenticatorModule()),
  ];
}
