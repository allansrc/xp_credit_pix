import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/app_page.dart';
import 'package:xp_ob/app/core/networking/http/dio_xp/dio_xp.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/authenticator_interceptors.dart';
import 'package:xp_ob/app/core/networking/http/interceptors/domain_interceptors.dart';
import 'package:xp_ob/app/modules/authenticator_module/authenticator_module.dart';
import 'package:xp_ob/app/modules/home_module/home_module.dart';

// import 'modules/auth/auth_module.dart';
// import 'modules/connectivity_check/connectivity_check_module.dart';
// import 'modules/home/home_module.dart';
// import 'modules/queue_request_module/queue_request_module.dart';
// import 'modules/splash/splash_page.dart';
// import 'modules/storage/storage_module.dart';
// import 'shared/http/custom_dio/custom_dio.dart';
// import 'shared/http/interceptors/auth_interceptors.dart';
// import 'shared/http/interceptors/domain_interceptors.dart';
// import 'shared/http/interceptors/queue_interceptors.dart';
// import 'shared/utils/services/delete_pdf_file.dart';
// import 'shared/utils/services/storage_capacity_service.dart';

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
    ModuleRoute('/authenticator', module: AuthenticatorModule()),
  ];
}
