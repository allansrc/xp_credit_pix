import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/card_tile.dart';
import 'package:xp_ob/app/core/theme/widgets/card_wrap.dart';

class InvestimentsPage extends StatefulWidget {
  const InvestimentsPage({Key? key}) : super(key: key);

  @override
  _InvestimentsPageState createState() => _InvestimentsPageState();
}

class _InvestimentsPageState extends State<InvestimentsPage> {
  bool isObscured = true;
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
                'Conta investimento',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  child: const Icon(
                    Icons.visibility,
                    color: XPColors.yellow,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: dimentions.width,
              decoration: const BoxDecoration(
                color: XPColors.black,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Valor disponível',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Text(
                          'R\$',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          isObscured ? '* * * * * *' : '35.525,00',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Ver mais',
                          style: TextStyle(
                            color: XPColors.backgroundLighter,
                            fontSize: 16,
                          ),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.double_arrow_rounded,
                            color: XPColors.yellow,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Atalhos',
                      style: TextStyle(
                        color: XPColors.backgroundLighter,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Wrap(
                      children: [
                        XPCardWrap(
                          icon: const Icon(
                            Icons.backup_table_outlined,
                            color: XPColors.yellow,
                          ),
                          title: 'Extrato',
                          ontap: () {},
                          colorCard: XPColors.background,
                          colorFont: XPColors.backgroundLighter,
                        ),
                        XPCardWrap(
                          icon: const Icon(
                            Icons.send_to_mobile_sharp,
                            color: XPColors.yellow,
                          ),
                          title: 'Transferir',
                          ontap: () {},
                          colorCard: XPColors.background,
                          colorFont: XPColors.backgroundLighter,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Quer depositar na sua conta XP?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: XPColors.backgroundLighter,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Use os dados abaixo para fazer a transferência',
                          style: TextStyle(
                            color: XPColors.backgroundLighter,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      color: XPColors.background,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Instituição',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )),
                        const SizedBox(height: 8),
                        const Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              '102 - SC XP Investimentos',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: XPColors.backgroundLighter,
                              ),
                            )),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              children: const [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Agência',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    )),
                                SizedBox(height: 8),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '0001',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: XPColors.backgroundLighter,
                                      ),
                                    )),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.copy,
                                color: XPColors.yellow,
                              ),
                            ),
                            Container(
                              height: 32,
                              width: 2,
                              color: Colors.grey,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 18),
                            ),
                            Column(
                              children: const [
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Conta corrente',
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                SizedBox(height: 8),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      '12345678',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: XPColors.backgroundLighter,
                                      ),
                                    )),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.copy,
                                color: XPColors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
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
