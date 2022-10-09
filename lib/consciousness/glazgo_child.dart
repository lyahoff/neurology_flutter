import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import '../consciousness.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class GlazgoChildrenScreen extends StatefulWidget {
  const GlazgoChildrenScreen({Key? key}) : super(key: key);

  @override
  State<GlazgoChildrenScreen> createState() => _GlazgoChildrenScreenState();
}

class _GlazgoChildrenScreenState extends State<GlazgoChildrenScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlazgoChildrenLogic(),
    );
  }
}

class GlazgoChildrenLogic extends StatefulWidget {
  const GlazgoChildrenLogic({Key? key}) : super(key: key);

  @override
  State<GlazgoChildrenLogic> createState() => _GlazgoChildrenLogicState();
}

class _GlazgoChildrenLogicState extends State<GlazgoChildrenLogic> {
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
          runApp(const ConsciousnessScreen());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                runApp(const ConsciousnessScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Детская шкала комы Глазго',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const GlazgoChild(),
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

class GlazgoChild extends StatefulWidget {
  const GlazgoChild({Key? key}) : super(key: key);

  @override
  State<GlazgoChild> createState() => _GlazgoChildState();
}

class _GlazgoChildState extends State<GlazgoChild> {
  int eye = 4;
  int verbal = 5;
  int move = 6;
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
                  'Детская шкала комы Глазго предназначена для детей младше 4-х лет и подобна шкале для взрослых за исключением оценки вербального ответа.'),
            )),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Открывание глаз (E, Eye response)'),
              ),
              RadioListTile(
                  title: h2Text('Спонтанное'),
                  value: eye,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        eye = 4;
                      }))),
              RadioListTile(
                  title: h2Text('В ответ на голосовой раздражитель'),
                  value: eye,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        eye = 3;
                      }))),
              RadioListTile(
                  title: h2Text('В ответ только на болевой раздражитель'),
                  value: eye,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        eye = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Реакция отсутствует'),
                  value: eye,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        eye = 1;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Речевая реакция (V, Verbal response)'),
              ),
              RadioListTile(
                  title: h2Text('Гулит и лепечет'),
                  value: verbal,
                  groupValue: 5,
                  onChanged: ((value) => setState(() {
                        verbal = 5;
                      }))),
              RadioListTile(
                  title: h2Text('Раздражительный плач'),
                  value: verbal,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        verbal = 4;
                      }))),
              RadioListTile(
                  title: h2Text('Плач в ответ на болевой раздражитель'),
                  value: verbal,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        verbal = 3;
                      }))),
              RadioListTile(
                  title: h2Text('Стоны в ответ на болевой раздражитель'),
                  value: verbal,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        verbal = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Реакция отсутствует'),
                  value: verbal,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        verbal = 1;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Двигательная реакция (M, Motor response)'),
              ),
              RadioListTile(
                  title: h2Text('Движения спонтанные и целенаправленные'),
                  value: move,
                  groupValue: 6,
                  onChanged: ((value) => setState(() {
                        move = 6;
                      }))),
              RadioListTile(
                  title: h2Text('Отдергивание в ответ на прикосновение'),
                  value: move,
                  groupValue: 5,
                  onChanged: ((value) => setState(() {
                        move = 5;
                      }))),
              RadioListTile(
                  title: h2Text('Отдергивание в ответ на болевой раздражитель'),
                  value: move,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        move = 4;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Децеребрационная поза в ответ на болевой раздражитель (патологическое сгибание)'),
                  value: move,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        move = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Децеребрационная поза в ответ на болевой раздражитель (патологическое разгибание)'),
                  value: move,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        move = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Реакция отсутствует'),
                  value: move,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        move = 1;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: glazgoChildResult(eye, verbal, move),
        )
      ],
    );
  }
}

Widget glazgoChildResult(int eye, int verbal, int move) {
  int total = eye + verbal + move;
  String result = '';
  if (total == 15) {
    result = 'Сумма баллов $total (E$eye V$verbal M$move)\n\nСознание ясное. ';
  }
  if (total == 13 || total == 14) {
    result =
        'Сумма баллов $total (E$eye V$verbal M$move)\n\nУмеренное оглушение. ';
  }
  if (total == 11 || total == 12) {
    result =
        'Сумма баллов $total (E$eye V$verbal M$move)\n\nГлубокое оглушение. ';
  }
  if (total == 9 || total == 10) {
    result = 'Сумма баллов $total (E$eye V$verbal M$move)\n\nСопор. ';
  }
  if (total == 7 || total == 8) {
    result = 'Сумма баллов $total (E$eye V$verbal M$move)\n\nКома 1. ';
  }
  if (total == 5 || total == 6) {
    result = 'Сумма баллов $total (E$eye V$verbal M$move)\n\nКома 2. ';
  }
  if (total == 3 || total == 4) {
    result = 'Сумма баллов $total (E$eye V$verbal M$move)\n\nКома 3. ';
  }
  return ListTile(
    title: h2Text(result),
  );
}
