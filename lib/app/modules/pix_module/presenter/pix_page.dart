import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/card_tile.dart';
import 'package:xp_ob/app/core/theme/widgets/card_wrap.dart';

class PixPage extends StatefulWidget {
  const PixPage({Key? key}) : super(key: key);

  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: XPColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: dimentions.width,
                height: dimentions.height * .2,
                decoration: const BoxDecoration(
                  color: XPColors.backgroundDarker,
                ),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 26,
                            backgroundColor: XPColors.background,
                            child: Icon(
                              Icons.person,
                              color: XPColors.yellow,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.exit_to_app, color: XPColors.yellow),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.settings_applications_outlined,
                            color: XPColors.yellow,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'José Doyle',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: const [
                              Text(
                                'Mais informações da conta',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(width: 8),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.double_arrow_rounded,
                                  color: XPColors.yellow,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // height: dimentions.height * .8,
                width: dimentions.width,
                decoration: const BoxDecoration(
                  color: XPColors.black,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Acesso rápido',
                        style: TextStyle(
                          color: XPColors.backgroundLighter,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: XPCardWrap(
                          icon: const Icon(
                            Icons.transform_outlined,
                            color: XPColors.yellow,
                          ),
                          title: 'Pix por crédito',
                          ontap: () {
                            Modular.to.pushNamed('/pix/');
                          },
                          colorCard: XPColors.background,
                          colorFont: XPColors.backgroundLighter,
                        ),
                      ),
                    ),
                    XPButtom(
                      width: dimentions.width,
                      text: 'Consultar limite de Pix',
                    ),
                    XPButtom(
                      width: dimentions.width,
                      text: 'Verificar pendências',
                    ),
                    XPButtom(
                      width: dimentions.width,
                      text: 'Bloquear Pix por crédito',
                    ),
                    XPButtom(
                      width: dimentions.width,
                      text: 'Solicitar aumento de crédito',
                    ),
                    const SizedBox(height: 24),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(16),
                      child: const Text(
                        'Confira as taxas  do Pix por crédito',
                        style: TextStyle(
                          color: XPColors.backgroundLighter,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: XPCardTile(
                        color: XPColors.backgroundDarker,
                        colorText: XPColors.backgroundLighter,
                        icon: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.settings,
                            color: XPColors.yellow,
                          ),
                        ),
                        boolSpacer: true,
                        title: 'Configurar Pix',
                        description:
                            'Gerencie seu limite diário de transferências ou suas chaves Pix.',
                        ontap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: XPCardTile(
                        color: XPColors.backgroundDarker,
                        colorText: XPColors.backgroundLighter,
                        icon: const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Icon(
                            Icons.backup_table_outlined,
                            color: XPColors.yellow,
                          ),
                        ),
                        boolSpacer: true,
                        title: 'Extrato e devoluções',
                        description: '',
                        ontap: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
