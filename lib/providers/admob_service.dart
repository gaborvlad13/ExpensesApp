import 'package:firebase_admob/firebase_admob.dart';

class AddMobService {
  String getAdMobAppId() {
    return 'ca-app-pub-5211416640474071~3300054400';
  }

  String getInterstitialAdId() {
    return 'ca-app-pub-5211416640474071/8043252800';
  }

  InterstitialAd getAfterAddScreenExit() {
    return InterstitialAd(
        adUnitId: getInterstitialAdId(),
        listener: (MobileAdEvent event) {
          print("InterstitialAd event is $event");
        });
  }
}
