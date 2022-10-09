import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AlgoverScreen extends StatefulWidget {
  const AlgoverScreen({Key? key}) : super(key: key);

  @override
  State<AlgoverScreen> createState() => _AlgoverScreenState();
}

class _AlgoverScreenState extends State<AlgoverScreen> {
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
              'Индекс Альговера',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const AlgoverLogic(),
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

class AlgoverLogic extends StatefulWidget {
  const AlgoverLogic({Key? key}) : super(key: key);

  @override
  State<AlgoverLogic> createState() => _AlgoverLogicState();
}

class _AlgoverLogicState extends State<AlgoverLogic> {
  String hrText = '0.0';
  String adText = '0.0';
  double hr = 0.0;
  double ad = 0.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
            color: Colors.grey[200],
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text('Шоковый индекс Альговера'),
                ),
                ListTile(
                  title: h2Text(
                      '''Шоковый индекс Альговера используется для определения уровня кровопотери.

Он вычисляется как соотношение частоты пульса (ЧСС) к уровню систолического артериального давления (САД).

ШИА = ЧСС/САД. В норме он приближается к 0,5
'''),
                ),
              ],
            )),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: const InputDecoration(
                      hintText: 'Введите значение ЧСС',
                      border: OutlineInputBorder()),
                  onChanged: (text) => setState(() {
                    hrText = text;
                    if (hrText.isEmpty) {
                      hrText = '0.0';
                    }
                    hr = double.parse(hrText);
                  }),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: const InputDecoration(
                      hintText: 'Введите значение САД',
                      border: OutlineInputBorder()),
                  onChanged: (text) => setState(() {
                    adText = text;
                    if (adText.isEmpty) {
                      adText = '0.0';
                    }
                    ad = double.parse(adText);
                  }),
                ),
              ],
            ),
          ),
        ),
        Card(
            color: Colors.amber,
            elevation: 2,
            child: ListTile(
              title: result(hr, ad),
            )),
      ],
    );
  }
}

Widget result(double a, double b) {
  var result = a / b;
  String algoverResult = '';
  var toLow = result.toStringAsFixed(2);

  if (result <= 0.5) {
    algoverResult = 'Результат составляет $toLow, что соответствует норме';
  }
  if (result > 0.5 && result <= 0.9) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку I степени. Потеря ОЦК 15-20%';
  }
  if (result > 0.9 && result <= 1.2) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку II степени. Потеря ОЦК 20-40%';
  }
  if (result >= 1.2) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку III степени. Потеря ОЦК более 40%';
  }
  return h1Text(algoverResult);
}
