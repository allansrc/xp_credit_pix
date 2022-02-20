import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/eleveted_button.dart';

class InvestorPage extends StatefulWidget {
  const InvestorPage({Key? key}) : super(key: key);

  @override
  _InvestorPageState createState() => _InvestorPageState();
}

class _InvestorPageState extends State<InvestorPage> {
  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: XPColors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: dimentions.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: dimentions.height * .2,
              ),
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: XPColors.black,
                    child: Icon(
                      Icons.person_add_alt,
                      color: XPColors.backgroundLighter,
                      size: 40,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Descubra o seu Perfil de investidor',
                  style: TextStyle(fontSize: 32, color: Colors.grey[700]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Seu perfil vai te ajudar na escolha dos melhores investimentos e sua política'
                  'permitirá que você escolha o quanto de risco deseja correr, '
                  'dentro do seu perfil de investidor, considerando seus objetivos'
                  'e seu momento de vida.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'Por que esse passp é tão importante?',
                      style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: XPColors.yellow,
                    )
                  ],
                ),
              ),
              Center(
                child: XPElevetedButtom(
                    width: 300, text: 'Responder questionário'),
              ),
              Center(
                child: XPButtom(
                  width: 300,
                  text: 'Migrar informações OpenFinance',
                  textColor: XPColors.backgroundDarker,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
