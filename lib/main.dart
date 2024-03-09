import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:numeros_para_baloto_app/config/router/app_router.dart';
import 'package:numeros_para_baloto_app/config/theme/app_theme.dart';
import 'package:numeros_para_baloto_app/presentation/shared/custom_banner_ad.dart';
import 'package:numeros_para_baloto_app/presentation/shared/custom_banner_ad2.dart';

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
    //TODO: cambiar id de publi
      adUnitId: 'ca-app-pub-3940256099942544/9257395921',
      //prod: ca-app-pub-8108449640361465/4326023083
      //test: ca-app-pub-3940256099942544/9257395921
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad){
            print('ad is loaded');
            openAd = ad;
            openAd!.show();
          },
          onAdFailedToLoad: (error) {
            print('ad failed to load $error');
          }), orientation: AppOpenAd.orientationPortrait
  );
}


void showAd() {
  if(openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }

  openAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (ad) {
      print('onAdShowedFullScreenContent');
    },
    onAdFailedToShowFullScreenContent: (ad, error){
      ad.dispose();
      print('failed to load $error');
      openAd = null;
      loadAd();
    },
    onAdDismissedFullScreenContent: (ad){
      ad.dispose();
      print('dismissed');
      openAd = null;
      loadAd();
    }
  );

  openAd!.show();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await MobileAds.instance.initialize();
  await loadAd();

  runApp(
    DevicePreview(
      builder: (_) => const MyApp(),
      enabled: !kReleaseMode,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo.jpg'), // Ruta de tu imagen
                  fit: BoxFit
                      .cover, // Ajusta la imagen para cubrir todo el contenedor
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: MaterialApp.router(
                routerConfig: appRouter,
                title: 'Miloto',
                builder: DevicePreview.appBuilder,
                locale: DevicePreview.locale(context),
                debugShowCheckedModeBanner: false,
                theme: AppTheme().getTheme(),
              ),
            ),
          ),
          Positioned(bottom: 0, child: AnchoredAdaptive()),
          Positioned(top: 0, child: AnchoredAdaptive2()),
        ],
      ),
    );
  }
}
