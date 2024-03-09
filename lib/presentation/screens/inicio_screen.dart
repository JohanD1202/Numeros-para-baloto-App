import 'package:flutter/material.dart';
//import 'package:numeros_para_baloto_app/presentation/screens/text_style.dart';
//import 'package:go_router/go_router.dart';
import 'package:numeros_para_baloto_app/widgets/filled_button.dart';


class InicioScreen extends StatelessWidget {

  static const name = 'screen_name';

  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonMiBaloto(),
              SizedBox(height: 80),
            FilledButtonBaloto(),
              SizedBox(height: 100),
            FilledButtonIniciar(),
          ],
        ),
      ),
    );
  }
}



