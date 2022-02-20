import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';
import 'package:xp_ob/app/core/theme/widgets/button.dart';
import 'package:xp_ob/app/core/theme/widgets/textfiled.dart';

class AuthenticatorPage extends StatefulWidget {
  const AuthenticatorPage({Key? key}) : super(key: key);

  @override
  _AuthenticatorPageState createState() => _AuthenticatorPageState();
}

class _AuthenticatorPageState extends State<AuthenticatorPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // first section
            Container(
              width: dimentions.width,
              height: .45 * dimentions.height,
              decoration: const BoxDecoration(color: XPColors.black),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    SizedBox(height: .1 * dimentions.height),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        XPButtom(text: 'Token'),
                        XPButtom(text: 'Abrir conta'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // second section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: const XPTextField(
                hintText: 'Número da conta',
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: const XPTextField(
                hintText: 'Senha',
                isPassword: true,
                isObscure: true,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: const Text(
                  'Esqueci minha senha',
                  style: TextStyle(color: XPColors.yellow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
