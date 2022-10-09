import 'package:flutter/material.dart';
import 'package:neurology_flutter/consciousness/four.dart';
import 'package:neurology_flutter/consciousness/glazgo.dart';
import 'package:neurology_flutter/consciousness/glazgo_child.dart';
import 'package:neurology_flutter/consciousness/richmond.dart';

import 'cards.dart';
import 'main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ConsciousnessScreen extends StatefulWidget {
  const ConsciousnessScreen({Key? key}) : super(key: key);

  @override
  State<ConsciousnessScreen> createState() => _ConsciousnessScreenState();
}

class _ConsciousnessScreenState extends State<ConsciousnessScreen> {
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
              'Уровень сознания',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              InkWell(
                  onTap: () {
                    runApp(const GlazgoScreen());
                  },
                  child: customCard('Шкала комы Глазго', 'assets/glazgo.png')),
              InkWell(
                  onTap: () {
                    runApp(const GlazgoChildrenScreen());
                  },
                  child: customCard(
                      'Детская шкала комы Глазго', 'assets/glazgo.png')),
              InkWell(
                  onTap: () {
                    runApp(const FOURScreen());
                  },
                  child: customCard('Шкала комы FOUR', 'assets/glazgo.png')),
              InkWell(
                onTap: () {
                  runApp(const RichmindScreen());
                },
                child: customCard(
                    'Шкала возбуждения-седации Ричмонда', 'assets/glazgo.png'),
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
