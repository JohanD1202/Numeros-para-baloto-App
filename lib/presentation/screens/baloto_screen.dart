import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:numeros_para_baloto_app/presentation/screens/menu_screen.dart';
import 'package:numeros_para_baloto_app/presentation/shared/balotas.dart';
import 'package:numeros_para_baloto_app/presentation/shared/tutorial.dart';
import 'package:numeros_para_baloto_app/presentation/shared/tutorial.dart';

class BalotoScreen extends StatefulWidget {
  static const name = 'baloto-screen';
  const BalotoScreen({Key? key}) : super(key: key);

  @override
  State<BalotoScreen> createState() => _BalotoScreenState();
}

class _BalotoScreenState extends State<BalotoScreen> {
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _initAd();
  }

  void _initAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-8108449640361465/6840746065",
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
            // Aquí puedes realizar acciones después de cerrar el anuncio si es necesario
          });
        },
      );

      // Mostrar el anuncio intersticial cuando se carga
      _showInterstitialAd();
    });
  }

  void _showInterstitialAd() {
    if (_isAdLoaded) {
      _interstitialAd.show();
    } else {
      debugPrint('InterstitialAd not loaded yet.');
    }
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: const LeadingCustom(),),
      body: SizedBox(
        height: size.height * 1,
        width: size.width * 1,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width * 1),
                Pulse(
                    infinite: true,
                    delay: const Duration(seconds: 1),
                    child: Image.asset(
                      'assets/logoBaloto.png',
                      width: 200,
                    )),
                const SizedBox(height: 40),
                const Balotas(),
              ],
            ),
            const AppTutorialScreen(),
          ],
        ),
      ),
    );
  }
}
