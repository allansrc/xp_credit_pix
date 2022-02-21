import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Container(
      width: dimentions.width,
      height: dimentions.height * .24,
      decoration: const BoxDecoration(
        color: XPColors.backgroundDarker,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
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
              const Spacer(),
              const Icon(Icons.exit_to_app, color: XPColors.yellow),
              const Padding(
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
                  'Olá, José',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text(
                      'Perfil CONSERVADOR e Política',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: XPColors.yellow,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Text(
                      'Mais informações da conta',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
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
    );
  }
}
