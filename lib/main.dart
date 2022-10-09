import 'package:flutter/material.dart';
import 'package:neurology_flutter/about.dart';
import 'package:neurology_flutter/algover.dart';
import 'package:neurology_flutter/consciousness.dart';
import 'package:neurology_flutter/epworth.dart';
import 'package:neurology_flutter/hant_hess.dart';
import 'package:neurology_flutter/ideal.dart';
import 'package:neurology_flutter/intracranial.dart';
import 'package:neurology_flutter/midas.dart';
import 'package:neurology_flutter/skf.dart';
import 'cards.dart';
import 'insult.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
      title: 'Калькулятор невропатолога',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Калькулятор невропатолога',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                runApp(const AboutScreen());
              },
              icon: const Icon(Icons.help),
              color: Colors.red,
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            InkWell(
              child: customCard(
                  'Ишемический инсульт\nПрофилактика сердечно-сосудистых заболеваний',
                  'assets/insult.png'),
              onTap: () {
                runApp(const InsultScreen());
              },
            ),
            InkWell(
              child: customCard(
                  'Внутричерепное кровоизлияние', 'assets/intracranial.png'),
              onTap: () {
                runApp(const IntracranialScreen());
              },
            ),
            InkWell(
              child: customCard(
                  'Субарахноидальное кровоизлияние\nШкала Ханта-Хесса',
                  'assets/subarach.png'),
              onTap: () {
                runApp(const HantScreen());
              },
            ),
            InkWell(
              child: customCard('Уровень сознания', 'assets/level.png'),
              onTap: () {
                runApp(const ConsciousnessScreen());
              },
            ),
            InkWell(
              child:
                  customCard('Головная боль\nШкала MIDAS', 'assets/pain.png'),
              onTap: () {
                runApp(const MidasScreen());
              },
            ),
            InkWell(
              child: customCard('Шкала Эпворта', 'assets/ep.png'),
              onTap: () {
                runApp(const EpworthScreen());
              },
            ),
            InkWell(
              child: customCard('Индекс Альговера', 'assets/algover.png'),
              onTap: () {
                runApp(const AlgoverScreen());
              },
            ),
            InkWell(
              child: customCard('Идеальная масса тела', 'assets/mass.png'),
              onTap: () {
                runApp(const IdealBodyMassScreen());
              },
            ),
            InkWell(
              child: customCard(
                  'Калькулятор СКФ и клиренса креатинина', 'assets/kidney.png'),
              onTap: () {
                runApp(const SkfScreen());
              },
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
    );
  }
}
