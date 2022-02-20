import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/card_wrap.dart';
import 'package:xp_ob/app/core/theme/widgets/eleveted_button.dart';

class OpenFinanceProfilePage extends StatefulWidget {
  const OpenFinanceProfilePage({Key? key}) : super(key: key);

  @override
  OpenFinanceProfilePageState createState() => OpenFinanceProfilePageState();
}

class OpenFinanceProfilePageState extends State<OpenFinanceProfilePage> {
  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: XPColors.background),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Carteira OpenFinance',
          style: TextStyle(color: XPColors.background),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: dimentions.width,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Investimentos recomendados para o seu perfil',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Conservador',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Wrap(
                children: [
                  XPCardWrap(
                    title: 'CDBs',
                    ontap: () {},
                  ),
                  XPCardWrap(
                    title: 'LCIs',
                    ontap: () {},
                  ),
                  XPCardWrap(
                    title: 'LCAs',
                    ontap: () {},
                  ),
                  XPCardWrap(
                    title: 'CRIs',
                    ontap: () {},
                  ),
                  XPCardWrap(
                    title: 'CRAs',
                    ontap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: XPElevetedButtom(
        onpressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        text: 'Trocar perfil de investimentos',
        width: 360,
      ),
    );
  }
}
