import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import '../insult.dart';

class HASBLEDScreen extends StatefulWidget {
  const HASBLEDScreen({Key? key}) : super(key: key);

  @override
  State<HASBLEDScreen> createState() => _HASBLEDScreenState();
}

class _HASBLEDScreenState extends State<HASBLEDScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HASBLEDLogic(),
    );
  }
}

class HASBLEDLogic extends StatefulWidget {
  const HASBLEDLogic({Key? key}) : super(key: key);

  @override
  State<HASBLEDLogic> createState() => _HASBLEDLogicState();
}

class _HASBLEDLogicState extends State<HASBLEDLogic> {
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
          title: appBarText('HAS-BLED'),
          centerTitle: true,
        ),
        body: const HasLogic(),
      ),
    );
  }
}

class HasLogic extends StatefulWidget {
  const HasLogic({Key? key}) : super(key: key);

  @override
  State<HasLogic> createState() => _HasLogicState();
}

class _HasLogicState extends State<HasLogic> {
  bool agBool = false;
  bool liverBool = false;
  bool kidneyBool = false;
  bool insultBool = false;
  bool bloodBool = false;
  bool mnoBool = false;
  bool ageBool = false;
  bool drugsBool = false;
  bool alcoholBool = false;
  int ag = 0;
  int liver = 0;
  int kidney = 0;
  int insult = 0;
  int blood = 0;
  int mno = 0;
  int age = 0;
  int drugs = 0;
  int alcohol = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 2,
          color: Colors.grey[200],
          child: h1Text(
              'HAS-BLED — шкала для оценки риска кровотечений. Акроним от Hypertension, Abnormal renal-liver function, Stroke, Bleeding history or predisposition, Labile international normalized ratio, Elderly, Drugs or alcohol concomitantly. Используется для оценки риска большого кровотечения в течение 1 года.'),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              CheckboxListTile(
                  title: h2Text('Гипертония'),
                  subtitle: const Text(
                      'Неконтролируемая, систолическое АД >160 мм рт. ст.'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: agBool,
                  onChanged: ((value) => setState(() {
                        agBool = value!;
                        ag = 1;
                        if (agBool == false) {
                          ag = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Нарушение функции печени'),
                  subtitle: const Text(
                      'Цирроз, нарушения в печеночных пробах: билирубина > 2 норм + АЛТ/АСТ/ЩФ > 3 норм'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: liverBool,
                  onChanged: ((value) => setState(() {
                        liverBool = value!;
                        liver = 1;
                        if (liverBool == false) {
                          liver = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Нарушение функции почек'),
                  subtitle: const Text(
                      'Диализ, трансплантация почки, креатинин более 200 мкмоль/л'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: kidneyBool,
                  onChanged: ((value) => setState(() {
                        kidneyBool = value!;
                        kidney = 1;
                        if (kidneyBool == false) {
                          kidney = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Инсульт в анамнезе'),
                  subtitle: const Text('Особенно лакунарный'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: insultBool,
                  onChanged: ((value) => setState(() {
                        insultBool = value!;
                        insult = 1;
                        if (insultBool == false) {
                          insult = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Кровотечения'),
                  subtitle: const Text(
                      'Большие кровотечения в анамнезе (интракраниальное, либо требующее госпитализации, либо со снижением Hb>2 г/л, либо требующее гемотрансфузию), анемия или предрасположенность к кровотечениям'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: bloodBool,
                  onChanged: ((value) => setState(() {
                        bloodBool = value!;
                        blood = 1;
                        if (bloodBool == false) {
                          blood = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Лабильное МНО'),
                  subtitle: const Text(
                      '<60 % времени в терапевтическом диапазоне, высокое МНО'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: mnoBool,
                  onChanged: ((value) => setState(() {
                        mnoBool = value!;
                        mno = 1;
                        if (mnoBool == false) {
                          mno = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Возраст более 65 лет'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: ageBool,
                  onChanged: ((value) => setState(() {
                        ageBool = value!;
                        age = 1;
                        if (ageBool == false) {
                          age = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Прием лекарств'),
                  subtitle: const Text(
                      'Прием лекарств, усиливающих риск кровотечения: антиагреганты, НПВП'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: drugsBool,
                  onChanged: ((value) => setState(() {
                        drugsBool = value!;
                        drugs = 1;
                        if (drugsBool == false) {
                          drugs = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Злоупотребление алкоголем'),
                  subtitle: const Text('более 8 рюмок в неделю'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: alcoholBool,
                  onChanged: ((value) => setState(() {
                        alcoholBool = value!;
                        alcohol = 1;
                        if (alcoholBool == false) {
                          alcohol = 0;
                        }
                      }))),
            ],
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: hasbledResult(
              ag, liver, kidney, insult, blood, mno, age, drugs, alcohol),
        )
      ],
    );
  }
}

Widget hasbledResult(
  int ag,
  int liver,
  int kidney,
  int insult,
  int blood,
  int mno,
  int age,
  int drugs,
  int alcohol,
) {
  int total =
      ag + liver + kidney + insult + blood + mno + age + drugs + alcohol;
  String result = '';
  if (total >= 0 && total <= 2) {
    result =
        'Результат в 2 балла и менее — нет значимого повышения риска кровотечений (1,88 кровотечения на 100 пациенто-лет), но необходим тщательный контроль.';
  }
  if (total >= 3) {
    result =
        'Результат в 3 балла и более ассоцирован с высоким риском развития кровотечения (3,74 кровотечения на 100 пациенто-лет).';
  }
  return ListTile(
    title: h2Text(result),
  );
}
