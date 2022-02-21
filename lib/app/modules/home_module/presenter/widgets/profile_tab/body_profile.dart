import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/theme/widgets/card_tile.dart';
import 'package:xp_ob/app/core/theme/widgets/card_wrap.dart';

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Container(
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
          Wrap(
            children: [
              XPCardWrap(
                icon: const Icon(
                  Icons.transform_outlined,
                  color: XPColors.yellow,
                ),
                title: 'Pix',
                ontap: () {
                  Modular.to.pushNamed('/pix/');
                },
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
              XPCardWrap(
                icon: const Icon(
                  Icons.done,
                  color: XPColors.yellow,
                ),
                title: 'Aprovações',
                ontap: () {},
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
              XPCardWrap(
                icon: const Icon(
                  Icons.document_scanner_outlined,
                  color: XPColors.yellow,
                ),
                title: 'Ordens',
                ontap: () {},
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
              XPCardWrap(
                icon: const Icon(
                  Icons.security,
                  color: XPColors.yellow,
                ),
                title: 'Token',
                ontap: () {},
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
              XPCardWrap(
                icon: const Icon(
                  Icons.dashboard_customize,
                  color: XPColors.yellow,
                ),
                title: 'Extrato',
                ontap: () {},
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
              XPCardWrap(
                icon: const Icon(
                  Icons.outbond,
                  color: XPColors.yellow,
                ),
                title: 'Transferir',
                ontap: () {},
                colorCard: XPColors.background,
                colorFont: XPColors.backgroundLighter,
              ),
            ],
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
                  Icons.message_outlined,
                  color: XPColors.yellow,
                ),
              ),
              boolSpacer: true,
              title: 'Assessoria XP',
              description:
                  ' Assessoria de investimentos \n\n  Entre em contato',
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
                  Icons.account_balance_wallet_outlined,
                  color: XPColors.yellow,
                ),
              ),
              boolSpacer: true,
              title: 'Carteira OpenFinance',
              description:
                  'Carteira recomendada com base em seus dados OpenBank',
              ontap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
