import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:googleads/api/ads_manager_Api/banner_ad_model.dart';
import 'package:googleads/Layout/header_widget.dart';
import 'package:googleads/api/ads_manager_api/ads_manager.dart';
import 'package:googleads/testing_widgets/station_line.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/src/material/text_theme.dart';
class FrostedDemo extends StatefulWidget {
  const FrostedDemo({Key? key}) : super(key: key);

  @override
  State<FrostedDemo> createState() => _FrostedDemoState();
}

class _FrostedDemoState extends State<FrostedDemo> {

  late RewardedAd _rewardedAd ;
  bool _isRewardedAdReady = false ;
  var _balance = 0 ;
  @override
  void initState() {
    _initGoogleMobileAds() ;
    _loadRewardedAd();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,

      body: new Stack(
        children: <Widget>[

          new Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: new BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)
                  ),
                  child: new Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children:[

                            SizedBox(height: 40,) ,
                            Center(
                                child:Image.asset('assets/image/coin.png',
                                  height: MediaQuery.of(context).size.width/4,
                                  width: MediaQuery.of(context).size.height/3,
                                )
                            ),
                            Center(
                              child :Text(
                                'Your balance is : ' ,
                                style:Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Center(
                              child: Text(
                                '$_balance',
                                style:Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                _showRewardedAd() ;
                              }, child: const Text('Watch Ad'),
                              style: ElevatedButton.styleFrom(
                                primary: HexColor('#7EE8FA'), // Background color
                                onPrimary: Colors.white, // Text Color (Foreground color)
                              ),
                            ),


                          ],
                        ) ,
                      )
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  Future<InitializationStatus>_initGoogleMobileAds(){
    return MobileAds.instance.initialize() ;
  }
  void _loadRewardedAd(){
    RewardedAd.load(
        adUnitId: AdsManager.rewardedAdUnitId,
        request: const AdRequest() ,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad){
              setState(() =>_rewardedAd=ad);
              ad.fullScreenContentCallback = FullScreenContentCallback(onAdDismissedFullScreenContent: (ad){
                setState(() => _isRewardedAdReady= false);
                _loadRewardedAd();

              });
              setState(()=>_isRewardedAdReady=true);
            },
            onAdFailedToLoad:(errer){
              print('Failed to load $errer');
            })
    ) ;
  }
//show Rewarded Ad
  void _showRewardedAd(){
    _rewardedAd.show(onUserEarnedReward:(AdWithoutView ad , RewardItem item){
      setState(() =>_balance += item.amount.toInt() );
    });
  }
}
