import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/card_tile.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Container(
      height: dimentions.height * .8,
      width: dimentions.width,
      decoration: const BoxDecoration(
        color: XPColors.backgroundLighter,
      ),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Estes serão os próximos passos da sua jornada',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 28,
                ),
              ),
            ),
          ),
          XPCardTile(
            ontap: () {
              Modular.to.pushNamed('/investor/');
            },
            title: 'Descubra o seu perfil de investidor',
            description:
                'Seu perfil vai ajudar na escolha dos melhores investimentos para você',
          ),
          XPCardTile(
            ontap: () {},
            title: 'Descubra o seu perfil de investidor',
            description:
                'Seu perfil vai ajudar na escolha dos melhores investimentos para você',
          ),
          XPCardTile(
            ontap: () {},
            title: 'Descubra o seu perfil de investidor',
            description:
                'Seu perfil vai ajudar na escolha dos melhores investimentos para você',
          ),
        ],
      ),
    );
  }
}
