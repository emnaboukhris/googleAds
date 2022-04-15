// @dart=2.9

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:googleads/banner_ad_model.dart';
import 'package:googleads/header_widget.dart';
import 'package:googleads/progress_line.dart';
import 'package:googleads/station_line.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'ads_manager.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Color _primaryColor = HexColor('#80FF72');
  Color _accentColor = HexColor('#7EE8FA') ;

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            primaryColor: _primaryColor,
            accentColor: _accentColor ,
            scaffoldBackgroundColor : Colors.grey.shade100 ,
            primarySwatch: Colors.grey ,

      ),
      home: Progress_Line()   );
  }
}

class GoogleAds extends StatefulWidget {

  @override
  State<GoogleAds> createState() => _GoogleAdsState();
}

class _GoogleAdsState extends State<GoogleAds> {
   RewardedAd _rewardedAd ;
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
    double _headerHeight = 250 ;

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
     child: Column(
        children:[
          Container(
            height: _headerHeight ,
            child : HeaderWidget(_headerHeight , true , Icons.login_rounded),

          ) ,
        SizedBox(height: 40,) ,
        Center(
          child:Image.asset('assets/image/coin.png',
          height: MediaQuery.of(context).size.width/3,
            width: MediaQuery.of(context).size.height/2,
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
        ,
      bottomSheet:   const AdBanner(),

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
