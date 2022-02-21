import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/card_tile.dart';
import 'package:xp_ob/app/core/theme/widgets/card_wrap.dart';

class InvestmentsPage extends StatefulWidget {
  const InvestmentsPage({Key? key}) : super(key: key);

  @override
  InvestmentsStatePage createState() => InvestmentsStatePage();
}

class InvestmentsStatePage extends State<InvestmentsPage>
    with SingleTickerProviderStateMixin {
  bool isObscured = true;
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                'Investimentos',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 24),
            TabBar(
              controller: tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: XPColors.yellow, width: 4),
              ),
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Resumo'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Carteira'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Evolução'),
                ),
              ],
            ),
            Container(
              width: dimentions.width,
              height: dimentions.height,
              decoration: const BoxDecoration(
                color: XPColors.black,
              ),
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: const [
                        SizedBox(height: 54),
                        Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 54,
                              backgroundColor: XPColors.background,
                              child: Icon(
                                Icons.monetization_on_outlined,
                                size: 44,
                                color: Colors.grey,
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Carteira',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Acompanhe sua carteira de investimentos. Faça uma TED e começe a investir',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        const SizedBox(height: 54),
                        const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 54,
                              backgroundColor: XPColors.background,
                              child: Icon(
                                Icons.align_vertical_bottom_sharp,
                                size: 44,
                                color: Colors.grey,
                              ),
                            )),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Evolução',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'Seu perfil vai te ajudar na escolha dos melhores investimentos e sua política'
                            'permitirá que você escolha o quanto de risco deseja correr, '
                            'dentro do seu perfil de investidor, considerando seus objetivos'
                            'e seu momento de vida.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 54),
                        XPButtom(
                          width: 360,
                          onpressed: () async {},
                          text: 'Conheça os investimentos',
                          textColor: XPColors.backgroundLighter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
