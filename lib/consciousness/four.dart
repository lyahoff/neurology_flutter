import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import '../consciousness.dart';

class FOURScreen extends StatefulWidget {
  const FOURScreen({Key? key}) : super(key: key);

  @override
  State<FOURScreen> createState() => _FOURScreenState();
}

class _FOURScreenState extends State<FOURScreen> {
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
              'Шкала комы FOUR',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const FourLogic(),
        ),
      ),
    );
  }
}

class FourLogic extends StatefulWidget {
  const FourLogic({Key? key}) : super(key: key);

  @override
  State<FourLogic> createState() => _FourLogicState();
}

class _FourLogicState extends State<FourLogic> {
  int eye = 4;
  int motor = 4;
  int brain = 4;
  int respiration = 4;
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
                  '''Шкала комы FOUR (Full Outline of UnResponsiveness) имеет преимущества перед шкалой комы Глазго, а именно: 
- точнее детализирует неврологический статус, 
- распознает синдром запертого человека, 
- дает оценку рефлексам ствола мозга, 
- дает оценку дыхательному паттерну, 
- выявляет различные стадии дислокации (вклинения) мозга'''),
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Открывание глаз Eye'),
                ),
                RadioListTile(
                    title: h2Text('Произвольное, с миганием и слежением'),
                    value: eye,
                    groupValue: 4,
                    onChanged: ((value) => setState(() {
                          eye = 4;
                        }))),
                RadioListTile(
                    title: h2Text('Открывает произвольно, но не следит'),
                    value: eye,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          eye = 3;
                        }))),
                RadioListTile(
                    title: h2Text('На голос'),
                    value: eye,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          eye = 2;
                        }))),
                RadioListTile(
                    title: h2Text('На боль'),
                    value: eye,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          eye = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Отсутствует'),
                    value: eye,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          eye = 0;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Движения Motor'),
                ),
                RadioListTile(
                    title: h2Text('Выполнение движений по команде'),
                    value: motor,
                    groupValue: 4,
                    onChanged: ((value) => setState(() {
                          motor = 4;
                        }))),
                RadioListTile(
                    title: h2Text('Тянется к месту боли'),
                    value: motor,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          motor = 3;
                        }))),
                RadioListTile(
                    title: h2Text('Сгибание на боль'),
                    value: motor,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          motor = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Разгибание на боль'),
                    value: motor,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          motor = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Отсутствуют или миоклонус'),
                    value: motor,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          motor = 0;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(children: [
              ListTile(
                title: h2Text('Стволовые рефлексы Brain'),
              ),
              RadioListTile(
                  title: h2Text('Зрачковый и роговичный рефлексы сохранены'),
                  value: brain,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        brain = 4;
                      }))),
              RadioListTile(
                  title: h2Text('Один зрачок расширен, не реагирует на свет'),
                  value: brain,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        brain = 3;
                      }))),
              RadioListTile(
                  title:
                      h2Text('Зрачковый или роговичный рефлексы отсутствует'),
                  value: brain,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        brain = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Зрачковый и роговичный рефлексы отсутствуют'),
                  value: brain,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        brain = 1;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Зрачковый, роговичный, кашлевой рефлексы отсутствуют'),
                  value: brain,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        brain = 0;
                      }))),
            ])),
        Card(
            elevation: 2,
            child: Column(children: [
              ListTile(
                title: h2Text('Дыхательный паттерн Respiration'),
              ),
              RadioListTile(
                  title:
                      h2Text('Самостоятельное нормальное эффективное дыхание'),
                  value: respiration,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        respiration = 4;
                      }))),
              RadioListTile(
                  title: h2Text('Дыхание типа Чейна-Стокса'),
                  value: respiration,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        respiration = 3;
                      }))),
              RadioListTile(
                  title: h2Text('Самостоятельное нерегулярное дыхание'),
                  value: respiration,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        respiration = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Аппаратное, с самостоятельными вдохами'),
                  value: respiration,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        respiration = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Аппаратное дыхание или апноэ'),
                  value: respiration,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        respiration = 0;
                      }))),
            ])),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: fourResult(eye, motor, brain, respiration),
        )
      ],
    );
  }
}

Widget fourResult(int eye, int motor, int brain, int respiration) {
  String result = '';
  int total = eye + motor + brain + respiration;
  if (total == 16) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nЯсное сознание';
  }
  if (total == 15) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nУмеренное оглушение';
  }
  if (total == 13 || total == 14) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nГлубокое оглушение';
  }
  if (total >= 9 && total <= 12) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nСопор';
  }
  if (total == 7 || total == 8) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nКома I';
  }
  if (total >= 1 && total <= 6) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nКома II';
  }
  if (total == 0) {
    result =
        'Сумма баллов $total (E$eye M$motor B$brain R$respiration)\n\nКома III (смерть коры головного мозга)';
  }
  return ListTile(
    title: h2Text(result),
  );
}
