import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/investor_page.dart';
import 'presenter/pages/investor_profile_page.dart';
import 'presenter/pages/openfinance_profile_page.dart';

class InvestorModule extends Module {
  @override
  List<Bind> get binds => [
        // ...featureDI, // feature binder generated by difeat
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, args) => const InvestorPage(),
        ),
        ChildRoute('/investor-profile',
            child: (_, args) => const InvestorProfilePage()),
        ChildRoute('/openfinance-profile',
            child: (_, args) => const OpenFinanceProfilePage()),
      ];
}
