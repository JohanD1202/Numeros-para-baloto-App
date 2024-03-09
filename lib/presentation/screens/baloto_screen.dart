import 'package:flutter/material.dart';
import 'package:numeros_para_baloto_app/presentation/screens/text_style.dart';
import 'package:numeros_para_baloto_app/widgets/filled_button.dart';


class BalotoScreen extends StatelessWidget {

  static const name = 'baloto_name';

  const BalotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Baloto', style: personalizado6()),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButtonGeneradorBaloto(),
            SizedBox(height: 80),
            FilledButtonResultadosBaloto(),
            SizedBox(height: 80),
            FilledButtonComprarBaloto(),
          ],
        ),
      ),
    );
  }
}