import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManager {
  static bool testMode = true ;
  static String get rewardedAdUnitId {
    if (testMode == true) {
      return RewardedAd.testAdUnitId ;

    }else if (Platform.isAndroid){
      return "ca-app-pub-6752549434299205/3380976654";

    }else if (Platform.isIOS){
      return "ca-app-pub-6752549434299205/3380976654";

    }else {
      throw UnsupportedError("unsupported platform") ;
    }

  }

  static String get bannerAdUnitId{
    if(testMode){
      return BannerAd.testAdUnitId ;
    }
    return "ca-app-pub-6752549434299205/6409592533" ;
  }
}