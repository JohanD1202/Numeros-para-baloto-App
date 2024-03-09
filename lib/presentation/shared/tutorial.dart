import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  SlideInfo(this.title, this.caption);
}

final slides = <SlideInfo>[
  SlideInfo(
    'assets/comojugar.png',
    'Baloto o Revancha son loterías en línea que se juegan al azar, donde el jugador apuesta eligiendo 5 números del 1 al 43, 5 balotas amarillas y una súper balota de color rojo que va del 1 al 16.',
  ),
  SlideInfo(
    'assets/paso1.png',
    'Solo debes dar click en el botón iniciar y la aplicación te va a mostar tus 6 números de la suerte en forma aleatoria.',
  ),
  SlideInfo(
    'assets/paso2.png',
    'Compra tu ticket y participa por estos grandes premios que tienen para ti.',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;
  int contador = 1;
  bool destruirTutorial = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageViewController.addListener(() {
        final page = pageViewController.page ?? 0;

        if (!endReach && page >= (slides.length - 1.5)) {
          setState(() {
            endReach = true;
          });
        }

        setState(() {
          contador = (page + 1).round();
        });
      });
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: !destruirTutorial
          ? Stack(
              children: [
                SizedBox(
                  height: 600,
                  child: PageView(
                    controller: pageViewController,
                    physics: const BouncingScrollPhysics(),
                    children: slides
                        .map(
                          (slideData) => _Slide(
                            title: slideData.title,
                            caption: slideData.caption,
                          ),
                        )
                        .toList(),
                  ),
                ),
                endReach
                    ? Positioned(
                        bottom: 0,
                        left: (size.width - 160 ) / 2,
                        child: FadeIn(
                          child: GestureDetector(
                            onTap: () {
                               destruirTutorial = true;
                                  setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Image.asset('assets/listo.png', width: 160,),
                            ))
                        ),
                      )
                    : const SizedBox(),
                Positioned(
                  bottom: 170,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      slides.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == contador - 1
                              ? Colors.yellow.shade600
                              : Colors.grey.shade300,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.3), // Color de la sombra
                              spreadRadius: 2, // Extensión de la sombra
                              blurRadius: 4, // Desenfoque de la sombra
                              offset: const Offset(
                                  0, 4), // Desplazamiento de la sombra
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const Text(''),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;

  const _Slide({
    required this.title,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Image.asset(title, width: 330,),
          const SizedBox(
            height: 20,
          ),
          Text(
            caption,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
