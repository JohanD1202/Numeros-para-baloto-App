import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BalotasMiLoto extends StatefulWidget {
  const BalotasMiLoto({Key? key}) : super(key: key);

  @override
  _BalotasState createState() => _BalotasState();
}

class _BalotasState extends State<BalotasMiLoto> {
  List<int> numerosGenerados = [];
  int valor1 = 0;
  int valor2 = 0;
  int valor3 = 0;
  int valor4 = 0;
  int valor5 = 0;
  bool isClicked = false;
  bool isInitialized = false; // Nueva variable para controlar la inicialización
  final Color color = const Color.fromARGB(255, 2, 222, 254);
  final Color colorTexto = Colors.black;
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  bool _isAdClosed = true;

  @override
  void initState() {
    super.initState();
    _initAd();
    // _showInterstitialAd();
  }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      //test: ca-app-pub-3940256099942544/1033173712
      //prod: ca-app-pub-8108449640361465/6840746065
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    setState(() {
      _interstitialAd = ad;
      _isAdLoaded = true;
      _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          setState(() {
            _isAdClosed = true;
          });
        },
      );
    });
  }

  void _showInterstitialAd() {
    if (_isAdLoaded) {
      _interstitialAd.show();
    } else {
      debugPrint('InterstitialAd not loaded yet.');
    }
  }

  void generarNumeroAleatorio() {
    if (!isInitialized) {
      final random = Random();
      setState(() {
        // Generar números hasta que no se repitan
        valor1 = _generarNumeroNoRepetido(random);
        valor2 = _generarNumeroNoRepetido(random);
        valor3 = _generarNumeroNoRepetido(random);
        valor4 = _generarNumeroNoRepetido(random);
        valor5 = _generarNumeroNoRepetido(random);

        // Agregar los números generados a la lista
        numerosGenerados.add(valor1);
        numerosGenerados.add(valor2);
        numerosGenerados.add(valor3);
        numerosGenerados.add(valor4);
        numerosGenerados.add(valor5);

        isClicked = true;
        isInitialized = true;
      });
    }
  }

  int _generarNumeroNoRepetido(Random random) {
    Set<int> numerosGeneradosSet = Set<int>.from(numerosGenerados);
    int numero;
    do {
      numero = random.nextInt(39);
    } while (numerosGeneradosSet.contains(numero));

    // Agregar el nuevo número a la lista
    numerosGenerados.add(numero);

    return numero;
  }

  Widget _animateBalotas() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        spacing: 25,
        runSpacing: 25,
        alignment: WrapAlignment.center,
        children: [
          AnimacionIndividual(
            delay: const Duration(milliseconds: 0),
            valor1: valor1 == 0 ? 1 : valor1,
            color: color,
            isClicked: isClicked,
          ),
          AnimacionIndividual(
            delay: const Duration(milliseconds: 1500),
            valor1: valor2 == 0 ? 1 : valor2,
            color: color,
            isClicked: isClicked,
          ),
          AnimacionIndividual(
            delay: const Duration(seconds: 3),
            valor1: valor3 == 0 ? 1 : valor3,
            color: color,
            isClicked: isClicked,
          ),
          AnimacionIndividual(
            delay: const Duration(milliseconds: 4500),
            valor1: valor4 == 0 ? 1 : valor4,
            color: color,
            isClicked: isClicked,
          ),
          AnimacionIndividual(
            delay: const Duration(seconds: 6),
            valor1: valor5 == 0 ? 1 : valor5,
            color: color,
            isClicked: isClicked,
          ),
        ],
      ),
    );
  }

 @override
void dispose() {
  if (_interstitialAd != null) {
    _interstitialAd.dispose();
  }
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !isClicked
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  alignment: WrapAlignment.center,
                  children: [
                    _BalotaIndividual(
                      valor: valor1,
                      color: color,
                      isClicked: isClicked,
                    ),
                    _BalotaIndividual(
                      valor: valor2,
                      color: color,
                      isClicked: isClicked,
                    ),
                    _BalotaIndividual(
                      valor: valor3,
                      color: color,
                      isClicked: isClicked,
                    ),
                    _BalotaIndividual(
                      valor: valor4,
                      color: color,
                      isClicked: isClicked,
                    ),
                    _BalotaIndividual(
                      valor: valor5,
                      color: color,
                      isClicked: isClicked,
                    ),
                  ],
                ),
              )
            : _isAdClosed
                ? _animateBalotas()
                : const Text(''),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: !isClicked
              ? GestureDetector(
                  onTap: () {
                    // _showInterstitialAd();
                    generarNumeroAleatorio();
                  },
                  child: Image.asset(
                    'assets/iniciar.png',
                    width: 150,
                  ),
                )
              : const Text(''),
        ),
      ],
    );
  }
}

class AnimacionIndividual extends StatelessWidget {
  const AnimacionIndividual({
    super.key,
    required this.valor1,
    required this.color,
    required this.isClicked,
    required this.delay,
    this.colorTexto = Colors.black,
  });

  final int valor1;
  final Color color;
  final bool isClicked;
  final Color colorTexto;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      from: 300,
      duration: const Duration(milliseconds: 1000),
      delay: delay,
      child: _BalotaIndividual(
        valor: valor1,
        color: color,
        isClicked: isClicked,
        colorTexto: colorTexto,
      ),
    );
  }
}

class _BalotaIndividual extends StatelessWidget {
  final int valor;
  final Color color;
  final Color colorTexto;
  final bool isClicked;

  const _BalotaIndividual({
    required this.valor,
    required this.color,
    this.colorTexto = Colors.black,
    required this.isClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isClicked
                ? Text(
                    valor <= 9 ? '0$valor' : '$valor',
                    style: TextStyle(
                      fontSize: 30,
                      color: colorTexto,
                    ),
                  )
                : Container(),
            !isClicked
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      '??',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ))
                : Container()
          ],
        ),
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const FilledButton({
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow.shade600,
      ),
      child: child,
    );
  }
}
