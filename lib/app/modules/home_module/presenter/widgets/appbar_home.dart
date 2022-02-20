import 'package:flutter/material.dart';
import 'package:xp_ob/app/core/theme/colors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimentions = MediaQuery.of(context).size;
    return Container(
      width: dimentions.width,
      height: dimentions.height * .12,
      decoration: const BoxDecoration(
        color: XPColors.black,
      ),
      child: Row(
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
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá, José',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Veja seu perfil',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Agência:',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '0001' + ' - ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'Conta:',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '123456789',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.visibility, color: XPColors.yellow),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.more_vert, color: XPColors.yellow),
          ),
        ],
      ),
    );
  }
}
