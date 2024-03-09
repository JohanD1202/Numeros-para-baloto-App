import 'package:flutter/material.dart';
import 'package:numeros_para_baloto_app/widgets/filled_button.dart';


class RevanchaScreen extends StatelessWidget {

  static const name = 'revancha_name';

  const RevanchaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FilledButtonRevancha2(),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonGeneradorRevancha(),
            SizedBox(height: 80),
            FilledButtonResultadosRevancha(),
            SizedBox(height: 80),
            FilledButtonComprarRevancha(),
          ],
        ),
      ),
    );
  }
}