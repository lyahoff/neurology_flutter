import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/insult/abcd2.dart';
import 'package:neurology_flutter/insult/cha2ds2.dart';
import 'package:neurology_flutter/insult/hasbled.dart';
import 'package:neurology_flutter/insult/nihss.dart';
import 'package:neurology_flutter/insult/renkin.dart';
import 'package:neurology_flutter/insult/rtpa.dart';
import 'package:neurology_flutter/main.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class InsultScreen extends StatefulWidget {
  const InsultScreen({Key? key}) : super(key: key);

  @override
  State<InsultScreen> createState() => _InsultScreenState();
}

class _InsultScreenState extends State<InsultScreen> {
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
              'Ишемический инсульт/Профилактика сердечно-сосудистых заболеваний',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              InkWell(
                onTap: () {
                  runApp(const NIHSSScreen());
                },
                child: customCard(
                    'Шкала инсульта национального института здоровья (NIHSS)',
                    'assets/nihss.png'),
              ),
              InkWell(
                onTap: () {
                  runApp(const CHA2Screen());
                },
                child: customCard(
                    'Шкала CHA2DS2-VASC\nоценки риска инсульта и системной тромбоэмболии у пациентов с фибрилляцией предсердий',
                    'assets/cha2.png'),
              ),
              InkWell(
                onTap: () {
                  runApp(const HASBLEDScreen());
                },
                child: customCard(
                    'Шкала HAS-BLED \nоценки риска кровотечений при мерцательной аритмии',
                    'assets/has.png'),
              ),
              InkWell(
                  onTap: () {
                    runApp(const ABSD2Screen());
                  },
                  child: customCard('Шкала ABCD2', 'assets/abcd.png')),
              InkWell(
                  onTap: () {
                    runApp(const RTpaScreen());
                  },
                  child: customCard('Расчет дозы rt-PA', 'assets/rt.png')),
              InkWell(
                  onTap: () {
                    runApp(const RenkinScreen());
                  },
                  child: customCard('Шкала Рэнкина', 'assets/renkin.png')),
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
