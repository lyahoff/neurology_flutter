import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SkfScreen extends StatefulWidget {
  const SkfScreen({Key? key}) : super(key: key);

  @override
  State<SkfScreen> createState() => _SkfScreenState();
}

class _SkfScreenState extends State<SkfScreen> {
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
              'Калькулятор СКФ и клиренса креатинина',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const SkfLogic(),
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

class SkfLogic extends StatefulWidget {
  const SkfLogic({Key? key}) : super(key: key);

  @override
  State<SkfLogic> createState() => _SkfLogicState();
}

class _SkfLogicState extends State<SkfLogic> {
  int race = 0;
  int sex = 0;
  String ageText = '0.0';
  String creatininText = '0.0';
  double age = 0.0;
  double creatinin = 0.0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          color: Colors.grey[200],
          elevation: 2,
          child: ListTile(
            title: h1Text(
                'Оценка скорости клубочковой фильтрации у взрослых по формуле CKD-EPI. \n\nСкорость клубочковой фильтрации (СКФ) оценивается с помощью уравнения, разработанного Сотрудничеством по эпидемиологии хронического заболевания почек (CKD-EPI).'),
          ),
        ),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Укажите пол пациента'),
                ),
                RadioListTile(
                  title: h2Text('Мужчина'),
                  value: sex,
                  groupValue: 0,
                  onChanged: (val) => setState(() {
                    sex = 0;
                  }),
                ),
                RadioListTile(
                  title: h2Text('Женщина'),
                  value: sex,
                  groupValue: 1,
                  onChanged: (val) => setState(() {
                    sex = 1;
                  }),
                ),
              ],
            )),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: 'Введите возраст',
                      border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {
                    ageText = value;
                    if (ageText.isEmpty) {
                      ageText = '0.0';
                    }
                    age = double.parse(ageText);
                  }),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: const InputDecoration(
                      hintText: 'Введите количество креатинина, мкмоль/л',
                      border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {
                    creatininText = value;
                    if (creatininText.isEmpty) {
                      creatininText = '0.0';
                    }
                    creatinin = double.parse(creatininText);
                  }),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: skfResult(sex, age, creatinin),
        )
      ],
    );
  }
}

Widget skfResult(int sex, double age, double creatinin) {
  String result = '';
  double total = 0.0;

  if (sex == 0 && creatinin <= 80.0) {
    total = 141.0 * pow(0.993, age) * pow((creatinin / 88.4) / 0.9, -0.412);

    if (total >= 90) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП I

Признаки повреждения почек с нормальной или повышенной СКФ.''';
    }

    if (total >= 60 && total <= 89) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП II

Признаки повреждения почек с начальным снижением СКФ.''';
    }

    if (total >= 30 && total <= 59) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП III

Умеренное снижение СКФ.''';
    }

    if (total >= 15 && total <= 29) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП IV

Выраженное снижение СКФ.''';
    }
    if (total < 15) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП V

Терминальная почечная недостаточность.''';
    }
  }

  if (sex == 0 && creatinin > 80.0) {
    total = 141.0 * pow(0.993, age) * pow((creatinin / 88.4) / 0.9, -1.210);
    if (total >= 90) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП I

Признаки повреждения почек с нормальной или повышенной СКФ.''';
    }

    if (total >= 60 && total <= 89) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП II

Признаки повреждения почек с начальным снижением СКФ.''';
    }

    if (total >= 30 && total <= 59) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП III

Умеренное снижение СКФ.''';
    }

    if (total >= 15 && total <= 29) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП IV

Выраженное снижение СКФ.''';
    }
    if (total < 15) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП V

Терминальная почечная недостаточность.''';
    }
  }

  if (sex == 1 && creatinin <= 62.0) {
    total = 144.0 * pow(0.993, age) * pow((creatinin / 88.4) / 0.7, -0.328);
    if (total >= 90) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП I

Признаки повреждения почек с нормальной или повышенной СКФ.''';
    }

    if (total >= 60 && total <= 89) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП II

Признаки повреждения почек с начальным снижением СКФ.''';
    }

    if (total >= 30 && total <= 59) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП III

Умеренное снижение СКФ.''';
    }

    if (total >= 15 && total <= 29) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП IV

Выраженное снижение СКФ.''';
    }
    if (total < 15) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП V

Терминальная почечная недостаточность.''';
    }
  }
  if (sex == 1 && creatinin > 62.0) {
    total = 144.0 * pow(0.993, age) * pow((creatinin / 88.4) / 0.7, -1.210);
    if (total >= 90) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП I

Признаки повреждения почек с нормальной или повышенной СКФ.''';
    }

    if (total >= 60 && total <= 89) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП II

Признаки повреждения почек с начальным снижением СКФ.''';
    }

    if (total >= 30 && total <= 59) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП III

Умеренное снижение СКФ.''';
    }

    if (total >= 15 && total <= 29) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП IV

Выраженное снижение СКФ.''';
    }
    if (total < 15) {
      double round = total.roundToDouble();
      result = '''$round

Стадия ХБП V

Терминальная почечная недостаточность.''';
    }
  }

  return ListTile(
    title: h2Text(result),
  );
}
