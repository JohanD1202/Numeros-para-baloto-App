import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AnchoredAdaptive2 extends StatefulWidget {
  @override
  _AnchoredAdaptiveState createState() =>
      _AnchoredAdaptiveState();
}

class _AnchoredAdaptiveState extends State<AnchoredAdaptive2> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {

    _anchoredAdaptiveAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      //Prod: ca-app-pub-8108449640361465/5074142324
      //Test: ca-app-pub-3940256099942544/6300978111
      size: AdSize.fullBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (_anchoredAdaptiveAd != null && _isLoaded) {
      return SizedBox(
        height: 50,
        width: size.width * 1,
        child: AdWidget(ad: _anchoredAdaptiveAd!),
      );
    }
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }
}
