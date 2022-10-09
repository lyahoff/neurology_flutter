import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import '../insult.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RTpaScreen extends StatefulWidget {
  const RTpaScreen({Key? key}) : super(key: key);

  @override
  State<RTpaScreen> createState() => _RTpaScreenState();
}

class _RTpaScreenState extends State<RTpaScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RTpaLogic(),
    );
  }
}

class RTpaLogic extends StatefulWidget {
  const RTpaLogic({Key? key}) : super(key: key);

  @override
  State<RTpaLogic> createState() => _RTpaLogicState();
}

class _RTpaLogicState extends State<RTpaLogic> {
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
    return WillPopScope(
      onWillPop: () async {
        runApp(const InsultScreen());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              runApp(const InsultScreen());
            },
          ),
          title: appBarText('rt-PA'),
          centerTitle: true,
        ),
        body: const Rtpa(),
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

class Rtpa extends StatefulWidget {
  const Rtpa({Key? key}) : super(key: key);

  @override
  State<Rtpa> createState() => _RtpaState();
}

class _RtpaState extends State<Rtpa> {
  String massText = '';
  double mass = 0.0;
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
                  'В качестве тромболитика при системном внутривенном тромболизисе используется рекомбинантный тканевой активатор фибриногена (rt-PA) (Альтеплаза, Актилизе,) в дозе 0,9 мг/кг массы тела пациента, 10% препарата вводят внутривенно болюсно, остальную дозу внутривенно капельно в течении 60 минут как можно раньше в пределах 3 часов после начала ишемического инсульта.'),
            )),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              maxLength: 5,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'Вес в кг', border: OutlineInputBorder()),
              onChanged: (text) => setState(() {
                massText = text;
                if (massText.isEmpty) {
                  massText = '0.0';
                }
                mass = double.parse(massText);
              }),
            ),
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: rtpaResult(mass),
        ),
        Card(
          elevation: 2,
          color: Colors.grey[200],
          child: ListTile(
            title: h2Text('''Показания

- Возраст ≥18 лет.
- Ожидается, что значительный неврологический дефицит приведет к долгосрочной инвалидности.
- Неконтрастная компьютерная томография, не показывающая кровоизлияния или сформировавшегося вновь очага инфаркта.
- Острые симптомы ишемического инсульта четко определенные, менее чем за 3 часа до введения t-PA (в рамках терапевтического окна 3-4,5 часа).

Противопоказания

- Систолическое АД > 185 мм. рт. ст. или диастолическое АД > 110 мм рт. ст. (несмотря на медицинское вмешательство для снижения АД).
- Судороги при поступлении (можно рассмотреть введение rt-PA, если сосудистая окклюзия может быть идентифицирована при КТ-ангиографии).
- Последние операции/травмы (менее 15 дней).
- Недавняя внутричерепная или спинальная хирургия, травма головы или инсульт (менее 3 месяцев).
- В анамнезе внутричерепное кровоизлияние, аневризма, артериовенозная мальформация, или новообразование.
- Активное внутреннее кровотечение (менее 22 дней).
- Количество тромбоцитов менее 100 000, активированное частичное тромбопластиновое время более 40 секунд после введения гепарина, протромбиновое время более 15 или МНО более 1,7, или известные коагулопатии.
- Подозрение на субарахноидальное кровоизлияние.
- По результатам КТ наличие внутримозгового кровоизлияния, субарахноидального кровоизлияния или обширного острого инфаркта (гиподенстность больше 1/3 полушария головного мозга).

Предупреждение

- Уровень глюкозы менее 50 мг/дл или более 400 мг/дл.
- Высокий риск кровотечения может произойти в подостром периоде бактериального эндокардита, у пациентов с МНО более 1,7.
- Риск может превысить пользу у пациентов с минимальным неврологическим дефицитом и быстрым регрессом неврологической симптоматики.
- Дополнительные предупреждения
- Возраст > 80 лет.
- История предшествующего инсульта и диабета.
- Любое использование антикоагулянтов до поступления, независимо от уровня МНО.
- NIHSS > 25.'''),
          ),
        )
      ],
    );
  }
}

Widget rtpaResult(double mass) {
  double total = mass * 0.9;
  double rnd = double.parse(total.toStringAsFixed(2));
  if (mass >= 100) {
    total = 90.0;
    rnd = double.parse(total.toStringAsFixed(2));
  }
  return ListTile(
    title: h2Text('Доза rt-PA: $rnd мг'),
  );
}
