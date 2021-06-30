import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/constants/constants.dart';

buildBannerAd({AdSize size = AdSize.banner}) => BannerAd(
      adUnitId: AdmobConstant.bannerId,
      request: AdRequest(),
      size: size,
      listener: AdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
        onApplicationExit: (Ad ad) => print('$BannerAd onApplicationExit.'),
      ),
    )..load();
