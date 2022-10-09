import 'package:flutter/material.dart';
import 'package:neurology_flutter/intracranial/functionality.dart';
import 'package:neurology_flutter/intracranial/volume.dart';
import 'cards.dart';
import 'main.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class IntracranialScreen extends StatefulWidget {
  const IntracranialScreen({Key? key}) : super(key: key);

  @override
  State<IntracranialScreen> createState() => _IntracranialScreenState();
}

class _IntracranialScreenState extends State<IntracranialScreen> {
  AdRequest? adRequest;
  BannerAd? bannerAd;
  @override
  void initState() {
    super.initState();
    adRequest = const AdRequest(
      nonPersonalizedAds: false,
    );

    BannerAdListener bannerAdListener = BannerAdListener(
        onAdClosed: ((ad) {
          bannerAd!.load();
        }),
        onAdFailedToLoad: (ad, error) => {bannerAd!.load()});
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: adMob,
        listener: bannerAdListener,
        request: adRequest!);
    bannerAd!.load();
  }

  @override
  void dispose() {
    bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          runApp(const MainScreen());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                runApp(const MainScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Внутричерепное кровоизлияние',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              InkWell(
                onTap: () {
                  runApp(const FunctionalityScreen());
                },
                child: customCard(
                    'Оценка функциональной самостоятельности после внутричерепного кровоизлияния',
                    'assets/function.png'),
              ),
              InkWell(
                onTap: () {
                  runApp(const VulumeScreen());
                },
                child: customCard('Расчет объема внутричерепного кровоизлияния',
                    'assets/volume.png'),
              ),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 50,
              color: Colors.white,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
