import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/intracranial.dart';

class FunctionalityScreen extends StatefulWidget {
  const FunctionalityScreen({Key? key}) : super(key: key);

  @override
  State<FunctionalityScreen> createState() => _FunctionalityScreenState();
}

class _FunctionalityScreenState extends State<FunctionalityScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          runApp(const IntracranialScreen());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                runApp(const IntracranialScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Оценка функциональной самостоятельности после внутричерепного кровоизлияния',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const FunctionalityLogic(),
        ),
      ),
    );
  }
}

class FunctionalityLogic extends StatefulWidget {
  const FunctionalityLogic({Key? key}) : super(key: key);

  @override
  State<FunctionalityLogic> createState() => _FunctionalityLogicState();
}

class _FunctionalityLogicState extends State<FunctionalityLogic> {
  int volume = 4;
  int age = 2;
  int local = 2;
  int glazgo = 2;
  int cogn = 1;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
          elevation: 2,
          color: Colors.grey[200],
          child: h1Text(
              '''Оценка функциональной самостоятельности после внутричерепного кровоизлияния

Данная шкала используется при поступлении в больницу для прогнозирования вероятности достижения функциональной самостоятельности (показатель исхода Глазго больше или равен 4) через 90 дней после внутричерепного кровоизлияния.

Исследователи отмечали, что за 90 дней ни один из пациентов с баллом, меньшим или равным 4, не достиг функциональной самостоятельности, в то время как более 80% пациентов с баллом 11 достигли функциональной самостоятельности.'''),
        ),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Объем внутричерепного кровоизлияния'),
                ),
                RadioListTile(
                    title: h2Text('Менее 30 cm³'),
                    value: volume,
                    groupValue: 4,
                    onChanged: ((value) => setState(() {
                          volume = 4;
                        }))),
                RadioListTile(
                    title: h2Text('30–60 cm³'),
                    value: volume,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          volume = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Более 60 cm³'),
                    value: volume,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          volume = 0;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Возраст'),
                ),
                RadioListTile(
                    title: h2Text('Менее 70 лет'),
                    value: age,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          age = 2;
                        }))),
                RadioListTile(
                    title: h2Text('70 - 79 лет'),
                    value: age,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          age = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Более 80 лет'),
                    value: age,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          age = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Локализация внутричерепного кровоизлияния'),
                ),
                RadioListTile(
                    title: h2Text('Лобная доля'),
                    value: local,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          local = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Теменная доля'),
                    value: local,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          local = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Затылочная доля'),
                    value: local,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          local = 0;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Оценка по шкале комы Глазго'),
                ),
                RadioListTile(
                    title: h2Text('9 баллов и более'),
                    value: glazgo,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          glazgo = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Менее 9 баллов'),
                    value: glazgo,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          glazgo = 0;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text(
                      'Когнитивные нарушения до внутричерепного кровоизлияния'),
                ),
                RadioListTile(
                    title: h2Text('Нет нарушений'),
                    value: cogn,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          cogn = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Имеются нарушения'),
                    value: cogn,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          cogn = 0;
                        }))),
              ],
            )),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: functionalityResult(volume, age, local, glazgo, cogn),
        )
      ],
    );
  }
}

Widget functionalityResult(
    int volume, int age, int local, int glazgo, int cogn) {
  String result = '';
  if (age == 3) age = 2;
  int total = volume + age + local + glazgo + cogn;
  if (total >= 0 && total <= 4) {
    result =
        'Результат: $total\n\nПроцент достижения функциональной самостоятельности 0%';
  }
  if (total >= 5 && total <= 8) {
    result =
        'Результат: $total\n\nПроцент достижения функциональной самостоятельности 48%';
  }
  if (total == 9 || total == 10) {
    result =
        'Результат: $total\n\nПроцент достижения функциональной самостоятельности 75%';
  }
  if (total == 11) {
    result =
        'Результат: $total\n\nПроцент достижения функциональной самостоятельности 95%';
  }
  return ListTile(
    title: h2Text(result),
  );
}
