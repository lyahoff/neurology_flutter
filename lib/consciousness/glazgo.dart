import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import '../consciousness.dart';

class GlazgoScreen extends StatefulWidget {
  const GlazgoScreen({Key? key}) : super(key: key);

  @override
  State<GlazgoScreen> createState() => _GlazgoScreenState();
}

class _GlazgoScreenState extends State<GlazgoScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GlazgoLogic(),
    );
  }
}

class GlazgoLogic extends StatefulWidget {
  const GlazgoLogic({Key? key}) : super(key: key);

  @override
  State<GlazgoLogic> createState() => _GlazgoLogicState();
}

class _GlazgoLogicState extends State<GlazgoLogic> {
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
              'Шкала комы Глазго',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const Glazgo(),
        ),
      ),
    );
  }
}

class Glazgo extends StatefulWidget {
  const Glazgo({Key? key}) : super(key: key);

  @override
  State<Glazgo> createState() => _GlazgoState();
}

class _GlazgoState extends State<Glazgo> {
  int eye = 4;
  int verbal = 5;
  int move = 6;
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
                  '''Шкала комы Глазго (ШКГ, Глазго-шкала тяжести комы, The Glasgow Coma Scale, GCS) — шкала для оценки нарушения сознания и комы детей старше 4 лет и взрослых. Шкала была опубликована в 1974 году профессорами нейрохирургии Грэхэмом Тиздейлом и Б. Дж. Дженнетт Института Неврологических наук Университета Глазго.

Шкала состоит из трёх тестов, оценивающих реакцию открывания глаз (E), а также речевые (V) и двигательные (M) реакции. За каждый тест начисляется определённое количество баллов.'''),
            )),
        Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: h2Text('Открывание глаз (E, Eye response)'),
              ),
              RadioListTile(
                  title: h2Text(
                      'Спонтанное открывание; сохранено открывание с морганием на базовом уровне'),
                  value: eye,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        eye = 4;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Открывание глаз в ответ на словесную инструкцию, речь или оклик'),
                  value: eye,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        eye = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Открывание глаз в ответ на боль, приложенную к конечностям или грудине'),
                  value: eye,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        eye = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Нет'),
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
                  title: h2Text('Ориентирован'),
                  value: verbal,
                  groupValue: 5,
                  onChanged: ((value) => setState(() {
                        verbal = 5;
                      }))),
              RadioListTile(
                  title: h2Text('Речь спутанная, но готов отвечать на вопросы'),
                  value: verbal,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        verbal = 4;
                      }))),
              RadioListTile(
                  title: h2Text('Неадекватная реакция; бессвязные слова'),
                  value: verbal,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        verbal = 3;
                      }))),
              RadioListTile(
                  title: h2Text('Нечленораздельная речь'),
                  value: verbal,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        verbal = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Нет'),
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
                  title: h2Text('Подчиняется командам для движения'),
                  value: move,
                  groupValue: 6,
                  onChanged: ((value) => setState(() {
                        move = 6;
                      }))),
              RadioListTile(
                  title: h2Text('Защищает рукой область болевого раздражения'),
                  value: move,
                  groupValue: 5,
                  onChanged: ((value) => setState(() {
                        move = 5;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Отдергивает конечность в ответ на болевой стимул'),
                  value: move,
                  groupValue: 4,
                  onChanged: ((value) => setState(() {
                        move = 4;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Отвечает на боль сгибательной реакцией (декортикационная поза)'),
                  value: move,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        move = 3;
                      }))),
              RadioListTile(
                  title: h2Text(
                      'Отвечает на боль разгибательной реакцией (децеребрационная поза)'),
                  value: move,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        move = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Нет'),
                  value: move,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        move = 1;
                      }))),
            ],
          ),
        ),
        Card(
          color: Colors.amber,
          elevation: 2,
          child: glazgoResult(eye, verbal, move),
        )
      ],
    );
  }
}

Widget glazgoResult(int eye, int verbal, int move) {
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
