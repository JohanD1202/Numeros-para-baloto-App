import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numeros_para_baloto_app/presentation/screens/menu_screen.dart';
import 'package:numeros_para_baloto_app/presentation/screens/resultados_screen.dart';

class MenuInterior3 extends StatelessWidget {
  static const name = 'menu-interior3';
  const MenuInterior3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void openDialog(BuildContext context, title, url) {
      showDialog(
        context: context,
        barrierColor: Colors.white,
        barrierDismissible: false,
        builder: (context) => ResultadosScreen(title: title, url: url),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingCustom(),
        title: Container(
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            boxShadow:  [
          BoxShadow(
            color: Colors.white, // Color de la sombra
            offset:  Offset(0, 5), // Desplazamiento en x, y
            blurRadius: 5.0, // Radio de difuminado
            spreadRadius: 5.0, // Radio de expansión
          ),
        ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/miloto.png',
              width: 150,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.push('/miloto'),
                  child: const _Opciones(imagen: 'assets/generador.png'),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    openDialog(
                        context, 'Resultados', 'https://baloto.com/miloto/resultados');
                  },
                  child: const _Opciones(imagen: 'assets/resultados.png'),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    openDialog(context, 'Comprar',
                        'https://apuestaaqui.baloto.com/#/seguridad/login');
                  },
                  child: const _Opciones(imagen: 'assets/comprar.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Opciones extends StatelessWidget {
  final String imagen;

  const _Opciones({
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 250, 255),
        borderRadius: BorderRadius.circular(20),
           boxShadow:  [
          BoxShadow(
            color: Colors.blue.shade400, // Color de la sombra
            offset: const Offset(0, 5), // Desplazamiento en x, y
            blurRadius: 10.0, // Radio de difuminado
            spreadRadius: 1.0, // Radio de expansión
          ),
        ],
        border: Border.all(
          color: Colors.blue.shade800, // Color del borde
          width: 3.0, // Ancho del borde
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagen,
          width: 200,
        ),
      ),
    );
  }
}
