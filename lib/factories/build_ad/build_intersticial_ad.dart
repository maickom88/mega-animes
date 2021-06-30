import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/constants/constants.dart';

InterstitialAd buildInterstitialAd() => InterstitialAd(
      adUnitId: AdmobConstant.intersticialId,
      request: request(),
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          print('${ad.runtimeType} loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('${ad.runtimeType} failed to load: $error.');
          ad.dispose();
          buildInterstitialAd();
        },
        onAdOpened: (Ad ad) => print('${ad.runtimeType} onAdOpened.'),
        onAdClosed: (Ad ad) {
          print('${ad.runtimeType} closed.');
          ad.dispose();
          buildInterstitialAd();
        },
        onApplicationExit: (Ad ad) =>
            print('${ad.runtimeType} onApplicationExit.'),
      ),
    )..load();

AdRequest request() => AdRequest(
      keywords: <String>['foo', 'bar'],
      contentUrl: 'http://foo.com/bar.html',
      nonPersonalizedAds: true,
    );
