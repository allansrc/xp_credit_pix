import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/eleveted_button.dart';

class InvestorProfilePage extends StatefulWidget {
  const InvestorProfilePage({Key? key}) : super(key: key);

  @override
  _InvestorProfilePageState createState() => _InvestorProfilePageState();
}

class _InvestorProfilePageState extends State<InvestorProfilePage> {
  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: XPColors.background),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Perfil de investimento',
          style: TextStyle(color: XPColors.background),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: dimentions.height,
          width: dimentions.width,
          decoration: const BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Você tem o perfil de investimentos',
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'O investidor com perfil conservador possui segurança'
                  ' como ponto decisivo para suas aplicações.\n \n'
                  'Em razão de suas baixa tolerância ao risco,'
                  ' esta pessoa busca retorno ao longo prazo'
                  ' e produtos que objetivam a preservação do patrimômio.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Icon(
                      Icons.align_vertical_bottom_sharp,
                      size: 32,
                      color: Colors.grey,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    'Risco da sua carteira',
                    style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '0 pt',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Risco atual da sua carteira',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[900]),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0 - 5 pts',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Variação de risco do seu perfil',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[900]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Text(
                      'PERFIS EXISTENTES DE INVESTIMENTOS',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: XPColors.yellow,
                    )
                  ],
                ),
              ),

              // const Center(
              //   child: XPButtom(
              //     width: 300,
              //     text: 'Migrar informações OpenFinance',
              //     textColor: XPColors.backgroundDarker,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const XPElevetedButtom(
        width: 360,
        text: 'Trocar perfil de investimentos',
      ),
    );
  }
}
