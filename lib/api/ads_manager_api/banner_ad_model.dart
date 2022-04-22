import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ads_manager.dart';

class AdBanner extends StatefulWidget {
  const AdBanner() : super();

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
 late BannerAd bannerAd ;
  bool _isAdReady = false ;
  AdSize _adSize = AdSize.banner ;
  void _createBannerAd(){
    bannerAd= BannerAd(
    size:_adSize,
      adUnitId: AdsManager.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad){
          setState(() {
            _isAdReady = true ;
          });
        }
        , onAdFailedToLoad: (ad,error){
          log('ad failed to load : ${error.message}');
      }
      ), request: const AdRequest(),


    );
    bannerAd.load() ;
  }
  @override
  void initState(){
    super.initState() ;
    _createBannerAd();
  }
 @override
void dispose(){
    super.dispose() ;
    bannerAd.dispose() ;
 }
 @override
  Widget build(BuildContext context) {
 if(_isAdReady){
   return Container (
     width: _adSize.width.toDouble()*2,
     height: _adSize.height.toDouble(),
     child: AdWidget(ad: bannerAd
     )
   );
 }
 return Container();
  }
}
