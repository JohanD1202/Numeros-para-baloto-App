import 'package:flutter/material.dart';
import 'package:numeros_para_baloto_app/presentation/screens/text_style.dart';
import 'package:numeros_para_baloto_app/widgets/filled_button.dart';


class MenuScreen extends StatelessWidget {

  static const name = 'menu_name';


  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU', style: personalizado2()),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonBaloto2(),
            SizedBox(height: 80),
            FilledButtonRevancha(),
            SizedBox(height: 80),
            FilledButtonMiLoto(),
          ],
        ),
      ),
    );
  }
}