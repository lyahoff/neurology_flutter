import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MidasScreen extends StatefulWidget {
  const MidasScreen({Key? key}) : super(key: key);

  @override
  State<MidasScreen> createState() => _MidasScreenState();
}

class _MidasScreenState extends State<MidasScreen> {
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
              'Шкала MIDAS',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const MidasLogic(),
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

class MidasLogic extends StatefulWidget {
  const MidasLogic({Key? key}) : super(key: key);

  @override
  State<MidasLogic> createState() => _MidasLogicState();
}

class _MidasLogicState extends State<MidasLogic> {
  String firstString = '0.0';
  String secondString = '0.0';
  String thirdString = '0.0';
  String fourthString = '0.0';
  String fifthString = '0.0';

  double first = 0.0;
  double second = 0.0;
  double third = 0.0;
  double fourth = 0.0;
  double fifth = 0.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 2,
          color: Colors.grey[200],
          child: ListTile(
            title: h1Text(
                '''Для оценки степени дезадаптации пациента, страдающего от мигрени, широко используют опросник «MIDAS» («Migraine Disability Assessment Questionnaire»), разработанный профессором R. Lipton и доктором W. Stewart (США) при поддержке фармацевтической компании «Астра Зенека».

Вопросы касаются головных болей, которые больной испытывал за последние 3 месяца. Оценивается влияние мигрени на работу или учёбу, ведение домашнего хозяйства, а также на активный отдых и участие в семейных и общественных мероприятиях.'''),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text(
                    'Сколько учебных или рабочих дней (полных или неполных) Вы пропустили по причине головной боли за последние 3 месяца?'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: '0 или более', border: OutlineInputBorder()),
                  onChanged: ((text) => setState(() {
                        firstString = text;
                        if (firstString.isEmpty) {
                          firstString = '0.0';
                        }
                        first = double.parse(firstString);
                      })),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text(
                    'В течение скольких дней за последние 3 месяца Ваша трудоспособность на работе или учёбе была снижена в два и более раза из-за головной боли (не считая тех дней, которые Вы указали в первом вопросе)? '),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: '0 или более', border: OutlineInputBorder()),
                  onChanged: ((text) => setState(() {
                        secondString = text;
                        if (secondString.isEmpty) {
                          secondString = '0.0';
                        }
                        second = double.parse(secondString);
                      })),
                ),
              )
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text(
                    'Сколько дней за последние 3 месяца Вы не занимались домашними делами или не делали домашнее задание из-за головной боли?'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: '0 или более', border: OutlineInputBorder()),
                  onChanged: ((text) => setState(() {
                        thirdString = text;
                        if (thirdString.isEmpty) {
                          thirdString = '0.0';
                        }
                        third = double.parse(thirdString);
                      })),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text(
                    'Сколько дней за последние 3 месяца продуктивность Вашей домашней работы была снижена наполовину и более по причине головной боли (не считая тех дней, которые Вы указали в третьем вопросе)? '),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: '0 или более', border: OutlineInputBorder()),
                  onChanged: ((text) => setState(() {
                        fourthString = text;
                        if (fourthString.isEmpty) {
                          fourthString = '0.0';
                        }
                        fourth = double.parse(fourthString);
                      })),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text(
                    'В течение скольких дней за последние 3 месяца головная боль препятствовала Вашему участию в семейных и общественных мероприятиях или активному отдыху?'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: const InputDecoration(
                      hintText: '0 или более', border: OutlineInputBorder()),
                  onChanged: ((text) => setState(() {
                        fifthString = text;
                        if (fifthString.isEmpty) {
                          fifthString = '0.0';
                        }
                        fifth = double.parse(fifthString);
                      })),
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: midasResult(first, second, third, fourth, fifth),
        )
      ],
    );
  }
}

Widget midasResult(
    double first, double second, double third, double fourth, double fifth) {
  String result = '';
  double total = first + second + third + fourth + fifth;

  if (total <= 5) {
    result = '''Степень I

Малая интенсивность боли, отсутствие или минимальное ограничение повседневной активности.''';
  }
  if (total > 5 && total <= 10) {
    result = '''Степень II

Умеренная или выраженная боль, незначительное ограничение повседневной активности.''';
  }
  if (total > 10 && total <= 20) {
    result = '''Степень 	III

Сильная боль, умеренно выраженное ограничение повседневной активности.''';
  }
  if (total >= 21) {
    result = '''Степень 	IV

Сильная боль, значительное снижение повседневной активности.''';
  }

  return ListTile(
    title: h2Text(result),
  );
}
