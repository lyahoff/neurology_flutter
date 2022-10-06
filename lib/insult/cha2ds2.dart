import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import '../insult.dart';

class CHA2Screen extends StatefulWidget {
  const CHA2Screen({Key? key}) : super(key: key);

  @override
  State<CHA2Screen> createState() => _CHA2ScreenState();
}

class _CHA2ScreenState extends State<CHA2Screen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CHA2Logic(),
    );
  }
}

class CHA2Logic extends StatefulWidget {
  const CHA2Logic({Key? key}) : super(key: key);

  @override
  State<CHA2Logic> createState() => _CHA2LogicState();
}

class _CHA2LogicState extends State<CHA2Logic> {
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
          title: appBarText('CHA2DS2-VASC'),
          centerTitle: true,
        ),
        body: const ChaLogic(),
      ),
    );
  }
}

class ChaLogic extends StatefulWidget {
  const ChaLogic({Key? key}) : super(key: key);

  @override
  State<ChaLogic> createState() => _ChaLogicState();
}

class _ChaLogicState extends State<ChaLogic> {
  bool snBool = false;
  bool agBool = false;
  bool sdBool = false;
  bool insultBool = false;
  bool infarktBool = false;
  int sn = 0;
  int ag = 0;
  int sd = 0;
  int insult = 0;
  int infarkt = 0;
  int age = 1;
  int sex = 0;
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
                  'Шкала CHA2DS2VASc является простым и доступным методом для оценки риска развития инсульта и тромбоэмболических осложнений у пациентов с трепетанием и фибрилляцией предсердий.')),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Клинические показатели'),
              ),
              CheckboxListTile(
                  title: h2Text(
                      'Сердечная недостаточность/дисфункция левого желудочка'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: snBool,
                  onChanged: ((value) => setState(() {
                        snBool = value!;
                        sn = 1;
                        if (snBool == false) {
                          sn = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Артериальная гипертензия'),
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
                  title: h2Text('Сахарный диабет'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: sdBool,
                  onChanged: ((value) => setState(() {
                        sdBool = value!;
                        sd = 1;
                        if (sdBool == false) {
                          sd = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text('Инсульт/ТИА/тромбоэмболии'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: insultBool,
                  onChanged: ((value) => setState(() {
                        insultBool = value!;
                        insult = 2;
                        if (insultBool == false) {
                          insult = 0;
                        }
                      }))),
              CheckboxListTile(
                  title: h2Text(
                      'Сосудистые заболевания (инфаркт миокарда, атеросклероз периферических артерий или бляшка в аорте)'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: infarktBool,
                  onChanged: ((value) => setState(() {
                        infarktBool = value!;
                        infarkt = 1;
                        if (infarktBool == false) {
                          infarkt = 0;
                        }
                      }))),
            ],
          ),
        ),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(title: h2Text('Возраст')),
                RadioListTile(
                    title: h2Text('65 лет – 74 года'),
                    value: age,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          age = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Более 75 лет'),
                    value: age,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          age = 2;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(title: h2Text('Пол')),
                RadioListTile(
                    title: h2Text('Мужской'),
                    value: sex,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          sex = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Женский'),
                    value: sex,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          sex = 1;
                        }))),
              ],
            )),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: chaResult(sn, ag, sd, insult, infarkt, age, sex),
        )
      ],
    );
  }
}

Widget chaResult(
    int sn, int ag, int sd, int insult, int infarkt, int age, int sex) {
  int total = sn + ag + sd + insult + infarkt + age + sex;
  String result = '';
  if (total == 0) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 0.0 %''';
  }
  if (total == 1) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 1.3 %''';
  }
  if (total == 2) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 2.2 %''';
  }
  if (total == 3) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 3.2 %''';
  }
  if (total == 4) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 4.0 %''';
  }
  if (total == 5) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 6.7 %''';
  }
  if (total == 6) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 9.8 %''';
  }
  if (total == 7) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 9.6 %''';
  }
  if (total == 8) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 6.7 %''';
  }
  if (total == 9) {
    result = '''Результат: $total
Риск развития инсульта в течение года: 15.2 %''';
  }
  return ListTile(
    title: h2Text(result),
  );
}
