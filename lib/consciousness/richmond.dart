import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import '../consciousness.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RichmindScreen extends StatefulWidget {
  const RichmindScreen({Key? key}) : super(key: key);

  @override
  State<RichmindScreen> createState() => _RichmindScreenState();
}

class _RichmindScreenState extends State<RichmindScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RichmondLogic(),
    );
  }
}

class RichmondLogic extends StatefulWidget {
  const RichmondLogic({Key? key}) : super(key: key);

  @override
  State<RichmondLogic> createState() => _RichmondLogicState();
}

class _RichmondLogicState extends State<RichmondLogic> {
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
              'Шкала возбуждения-седации Ричмонда',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const Richmond(),
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

class Richmond extends StatefulWidget {
  const Richmond({Key? key}) : super(key: key);

  @override
  State<Richmond> createState() => _RichmondState();
}

class _RichmondState extends State<Richmond> {
  int result = 0;
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
                'Шкала RASS (шкала возбуждения-седации Ричмонда, Richmond Agitation-Sedation Scale) используется в отделении анестезиологии-реанимации и интенсивной терапии для описания степени агрессии больного или уровня глубины седации. Как правило, шкала RASS используется у больных, находящихся на продленной искусственной вентиляции легких.'),
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              RadioListTile(
                  title: h2Text(
                      'Больной агрессивен, воинственен, представляет непосредственную опасность для медицинского персонала'),
                  value: result,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        result = 4;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Тянет или удаляет трубки и катетеры или имеет агрессивное поведение по отношению к медицинскому персоналу'),
                  value: result,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        result = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Частые нецеленаправленные движения и/или десинхронизация с аппаратом ИВЛ'),
                  value: result,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        result = 2;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Взволнован, но движения не энергичные и не агрессивные'),
                  value: result,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        result = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Бодрствует, спокоен, внимателен'),
                  value: result,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        result = 0;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Потеря внимательности, но при вербальном контакте не закрывает глаза дольше 10 секунд'),
                  value: result,
                  groupValue: -1,
                  onChanged: ((value) => setState(() {
                        result = -1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'При вербальном контакте закрывает глаза меньше,  чем через 10 секунд'),
                  value: result,
                  groupValue: -2,
                  onChanged: ((value) => setState(() {
                        result = -2;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Любое движение (но не зрительный контакт), в ответ на голос'),
                  value: result,
                  groupValue: -3,
                  onChanged: ((value) => setState(() {
                        result = -3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Никакой реакции на голос, но есть какие-либо движения на физическую стимуляцию'),
                  value: result,
                  groupValue: -4,
                  onChanged: ((value) => setState(() {
                        result = -4;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Никакой реакции на голос и физическую стимуляцию'),
                  value: result,
                  groupValue: -5,
                  onChanged: ((value) => setState(() {
                        result = -5;
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: richmondResult(result),
        )
      ],
    );
  }
}

Widget richmondResult(int result) {
  String richmondText = '';
  if (result == 4) {
    richmondText = 'Агрессивен';
  }
  if (result == 3) {
    richmondText = 'Крайне возбужден';
  }
  if (result == 2) {
    richmondText = 'Возбужден';
  }
  if (result == 1) {
    richmondText = 'Беспокоен';
  }
  if (result == 0) {
    richmondText = 'Бодрствует, спокоен, внимателен';
  }
  if (result == -1) {
    richmondText = 'Сонлив';
  }
  if (result == -2) {
    richmondText = 'Легкая седация';
  }
  if (result == -3) {
    richmondText = 'Умеренная седация';
  }
  if (result == -4) {
    richmondText = 'Глубокая седация';
  }
  if (result == -5) {
    richmondText = 'Отсутствие пробуждения';
  }
  return ListTile(
    title: h2Text(richmondText),
  );
}
