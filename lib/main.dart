
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const GoogleAds()   );
  }
}

class GoogleAds extends StatefulWidget {
  const GoogleAds({Key? key}) : super(key: key);

  @override
  State<GoogleAds> createState() => _GoogleAdsState();
}

class _GoogleAdsState extends State<GoogleAds> {
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
      appBar : AppBar(title: Text('Watch more win more ... '),),
      body: Column(      children:[
        Center(
          child:Image.asset('assets/image/coin.png',
          height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.height,
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
        ), 
      ],
      ) ,
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
