import 'package:flutter/material.dart';
import 'package:numeros_para_baloto_app/widgets/filled_button.dart';

class MiLotoScreen extends StatelessWidget {

  static const name = 'mi_loto_name';

  const MiLotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FilledButtonMiLoto2(),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonGeneradorMiLoto(),
            SizedBox(height: 80),
            FilledButtonResultadosMiLoto(),
            SizedBox(height: 80),
            FilledButtonComprarMiLoto(),
          ],
        ),
      ),
    );
  }
}