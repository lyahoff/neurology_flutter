import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';

class IdealBodyMassScreen extends StatefulWidget {
  const IdealBodyMassScreen({Key? key}) : super(key: key);

  @override
  State<IdealBodyMassScreen> createState() => _IdealBodyMassScreenState();
}

class _IdealBodyMassScreenState extends State<IdealBodyMassScreen> {
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
              'Идеальная масса тела',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const IdealBodyLogic(),
        ),
      ),
    );
  }
}

class IdealBodyLogic extends StatefulWidget {
  const IdealBodyLogic({Key? key}) : super(key: key);

  @override
  State<IdealBodyLogic> createState() => _IdealBodyLogicState();
}

class _IdealBodyLogicState extends State<IdealBodyLogic> {
  int radio = 1;
  String height = '';
  int indexHeight = 0;
  String result = '';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
            elevation: 2,
            child: ListTile(
              tileColor: Colors.grey[200],
              title: h1Text(
                  '''Вычисление нормального веса для взрослых может быть произведено двумя методами: по Дивайну или Робинсону. Разница этих методов состоит в различии коэффициентов, применяемых в формулах для расчета.

Стоит отметить, что наиболее популярной является формула, предложенная доктором Дивайном в 1974 году. Сначала эта формула использовалась для расчета дозы медикаментов для пациентов. Затем идеальный индекс массы тела стал применяться более широко.'''),
            )),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h2Text('Укажите пол:'),
              ),
              RadioListTile(
                  title: h2Text('Мужской'),
                  value: radio,
                  groupValue: 1,
                  onChanged: (val) => setState(() {
                        radio = 1;
                      })),
              RadioListTile(
                  title: h2Text('Женский'),
                  value: radio,
                  groupValue: 2,
                  onChanged: (val) => setState(() {
                        radio = 2;
                      })),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Рост в см', border: OutlineInputBorder()),
                  onChanged: (text) => setState(() {
                    height = text;
                    indexHeight = int.parse(height);
                    if (height.isEmpty) {
                      result = '0';
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
        Card(
            color: Colors.amber,
            elevation: 2,
            child: ListTile(
              title: ideal(radio, indexHeight, result),
            ))
      ],
    );
  }
}

Widget ideal(int radio, int indexHeight, String result) {
  var devine = 0.0;
  var robinson = 0.0;

  if (radio == 1) {
    devine = 50 + 2.3 * (0.394 * indexHeight - 60);
    robinson = 52 + 1.9 * (0.394 * indexHeight - 60);
    var devineToLow = devine.toStringAsFixed(2);
    var robinsonToLow = robinson.toStringAsFixed(2);
    result =
        'Идеальная масса тела по методу Devine = $devineToLow\n\nИдеальная масса тела по методу Robinson = $robinsonToLow';
  }

  if (radio == 2) {
    devine = 45.5 + 2.3 * (0.394 * indexHeight - 60);
    robinson = 49 + 1.7 * (0.394 * indexHeight - 60);
    var devineToLow = devine.toStringAsFixed(2);
    var robinsonToLow = robinson.toStringAsFixed(2);
    result =
        'Идеальная масса тела по методу Devine = $devineToLow\n\nИдеальная масса тела по методу Robinson = $robinsonToLow';
  }

  return h2Text(result);
}
