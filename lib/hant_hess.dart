import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';

class HantScreen extends StatefulWidget {
  const HantScreen({Key? key}) : super(key: key);

  @override
  State<HantScreen> createState() => _HantScreenState();
}

class _HantScreenState extends State<HantScreen> {
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
              'Шкала Ханта-Хесса',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const HantLogic(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

class HantLogic extends StatefulWidget {
  const HantLogic({Key? key}) : super(key: key);

  @override
  State<HantLogic> createState() => _HantLogicState();
}

class _HantLogicState extends State<HantLogic> {
  int radio = 1;
  bool chB = false;
  int chBvalue = 0;
  int total = 0;
  String title = '';
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
                  'Шкала Ханта Хесса позволяет оценить риск хирургической летальности у пациентов с нетравматическим субарахноидальным кровоизлиянием.')),
        ),
        Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: h2Text('Критерии'),
              ),
              RadioListTile(
                  title: h2Text(
                      'Бессимптомное течение, возможна слабовыраженная головная боль или ригидность мышц затылка'),
                  value: radio,
                  groupValue: 1,
                  onChanged: (val) {
                    setState(() {
                      radio = 1;
                    });
                  }),
              RadioListTile(
                  title: h2Text(
                      'Головная боль умеренная или слабовыраженная; менингеальный синдром выражен; очаговая неврологическая симптоматика отсутствует за исключением возможного поражения глазодвигательных нервов'),
                  value: radio,
                  groupValue: 2,
                  onChanged: (val) {
                    setState(() {
                      radio = 2;
                    });
                  }),
              RadioListTile(
                  title: h2Text(
                      'Менингеальный синдром выражен; сознание расстроено до оглушения; очаговая симптоматика умеренно выражена'),
                  value: radio,
                  groupValue: 3,
                  onChanged: (val) {
                    setState(() {
                      radio = 3;
                    });
                  }),
              RadioListTile(
                  title: h2Text(
                      'Менингеальный синдром выражен; сознание расстроено до сопора; очаговая симптоматика выражена; имеются признаки нарушения витальных функций'),
                  value: radio,
                  groupValue: 4,
                  onChanged: (val) {
                    setState(() {
                      radio = 4;
                    });
                  }),
              RadioListTile(
                  title: h2Text(
                      'Кома различной глубины; акинетический мутизм, децеребрационная ригидность'),
                  value: radio,
                  groupValue: 5,
                  onChanged: (val) {
                    setState(() {
                      radio = 5;
                    });
                  }),
            ],
          ),
        ),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Дополнительно'),
              ),
              CheckboxListTile(
                  title: h2Text(
                      'Артериальная гипертензия, сахарный диабет, атеросклероз, ХОБЛ или вазоспазм при ангиографии'),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: chB,
                  onChanged: (val) {
                    setState(() {
                      chB = val!;
                      chBvalue = 1;
                      if (chB == false) {
                        chBvalue = 0;
                      }
                    });
                  })
            ],
          ),
        ),
        Card(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.amberAccent,
              title: hantResult(radio, chBvalue, total, title),
            ))
      ],
    );
  }
}

Widget hantResult(int radio, int chBvalue, int total, String title) {
  total = radio + chBvalue;

  if (total == 1) {
    title =
        '1 балл. При выявлении аневризмы возможно проведение незамедлительного оперативного лечения. Риск хирургической летальности - 30%';
  }
  if (total == 2) {
    title =
        '2 балла. При выявлении аневризмы возможно проведение незамедлительного оперативного лечения. Риск хирургической летальности - 40%';
  }
  if (total == 3) {
    title =
        '3 балла. При выявлении аневризмы проводится консервативное лечение до достижения 2-х или 1-го балла по шкале. Риск хирургической летальности - 50%';
  }
  if (total == 4) {
    title =
        '4 балла. При выявлении аневризмы проводится консервативное лечение до достижения 2-х или 1-го балла по шкале. Риск хирургической летальности - 80%';
  }
  if (total == 5) {
    title =
        '5 баллов. При выявлении аневризмы проводится консервативное лечение до достижения 2-х или 1-го балла по шкале. Риск хирургической летальности - 90%';
  }
  if (total == 6) {
    title =
        '6 баллов. При выявлении аневризмы проводится консервативное лечение до достижения 2-х или 1-го балла по шкале. Риск хирургической летальности - 90%';
  }

  return h1Text(title);
}
