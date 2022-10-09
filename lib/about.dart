import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
              'О приложении',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const About(),
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

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 2,
          color: Colors.amber,
          child: ListTile(
            title: h1Text(
                '''Данное приложение является набором калькуляторов для использования медицинскими работниками. 
            
Все результаты, которые получены в результате использования приложения необходимо интерпретировать врачами. 

Результаты вычислений данных калькуляторов не являются диагнозами.

Все калькуляторы взяты из сети интернет, и находятся в свободном доступе.

Если вы продолжаете использование приложения, то полностью согласны с информацией выше.

Если не согласны, то рекомендуется удалить данное приложение.'''),
          ),
        )
      ],
    );
  }
}
