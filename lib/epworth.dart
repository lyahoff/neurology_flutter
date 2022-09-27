import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';

class EpworthScreen extends StatefulWidget {
  const EpworthScreen({Key? key}) : super(key: key);

  @override
  State<EpworthScreen> createState() => _EpworthScreenState();
}

class _EpworthScreenState extends State<EpworthScreen> {
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
              'Шкала Эпворта',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: EpworthLogic(),
        ),
      ),
    );
  }
}

class EpworthLogic extends StatefulWidget {
  const EpworthLogic({Key? key}) : super(key: key);

  @override
  State<EpworthLogic> createState() => _EpworthLogicState();
}

class _EpworthLogicState extends State<EpworthLogic> {
  int read = 0;
  int tv = 0;
  int theatre = 0;
  int car = 0;
  int bed = 0;
  int alcohol = 0;
  int speak = 0;
  int drive = 0;
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
                  '''Шкала сонливости Эпворта - это анкетный опрос, составленный специально для оценки сонливости и вероятности наличия нарколепсии. Все, что от Вас требуется - ответить на несколько вопросов касательно вероятности заснуть в описанных ситуациях. По завершению тестирования Вам будет выдан результат с расшифровкой и рекомендациями.'''),
            )),
        Card(
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: h1Text('Вероятность задремать читая книгу сидя'),
              ),
              RadioListTile(
                  title: h2Text('Никогда бы не задремал'),
                  value: read,
                  groupValue: 0,
                  onChanged: ((value) => setState(() {
                        read = 0;
                      }))),
              RadioListTile(
                  title: h2Text('Есть небольшой шанс задремать'),
                  value: read,
                  groupValue: 1,
                  onChanged: ((value) => setState(() {
                        read = 1;
                      }))),
              RadioListTile(
                  title: h2Text('Есть средняя вероятность задремать'),
                  value: read,
                  groupValue: 2,
                  onChanged: ((value) => setState(() {
                        read = 2;
                      }))),
              RadioListTile(
                  title: h2Text('Есть высокая вероятность задремать'),
                  value: read,
                  groupValue: 3,
                  onChanged: ((value) => setState(() {
                        read = 3;
                      }))),
            ],
          ),
        ),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title:
                      h1Text('Вероятность задремать просматривая телепередачи'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: tv,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          tv = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: tv,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          tv = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: tv,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          tv = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: tv,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          tv = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать сидя в общественном месте без проявления активности (в театре или на собрании)'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: theatre,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          theatre = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: theatre,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          theatre = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: theatre,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          theatre = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: theatre,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          theatre = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать в качестве пассажира в машине при движении без остановки в течение часа'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: car,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          car = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: car,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          car = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: car,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          car = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: car,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          car = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать во время отдыха в кровати во второй половине дня, если позволяет ситуация'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: bed,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          bed = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: bed,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          bed = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: bed,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          bed = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: bed,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          bed = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать сидя в спокойной обстановке после обеда без потребления алкоголя'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: alcohol,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          alcohol = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: alcohol,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          alcohol = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: alcohol,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          alcohol = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: alcohol,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          alcohol = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать сидя и разговаривая с кем-либо'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: speak,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          speak = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: speak,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          speak = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: speak,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          speak = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: speak,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          speak = 3;
                        }))),
              ],
            )),
        Card(
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text(
                      'Вероятность задремать за рулём машины, остановившись на несколько минут на светофоре или в пробке'),
                ),
                RadioListTile(
                    title: h2Text('Никогда бы не задремал'),
                    value: drive,
                    groupValue: 0,
                    onChanged: ((value) => setState(() {
                          drive = 0;
                        }))),
                RadioListTile(
                    title: h2Text('Есть небольшой шанс задремать'),
                    value: drive,
                    groupValue: 1,
                    onChanged: ((value) => setState(() {
                          drive = 1;
                        }))),
                RadioListTile(
                    title: h2Text('Есть средняя вероятность задремать'),
                    value: drive,
                    groupValue: 2,
                    onChanged: ((value) => setState(() {
                          drive = 2;
                        }))),
                RadioListTile(
                    title: h2Text('Есть высокая вероятность задремать'),
                    value: drive,
                    groupValue: 3,
                    onChanged: ((value) => setState(() {
                          drive = 3;
                        }))),
              ],
            )),
        epworthResult(read, tv, theatre, car, bed, alcohol, speak, drive)
      ],
    );
  }
}

Widget epworthResult(int read, int tv, int theatre, int car, int bed,
    int alcohol, int speak, int drive) {
  int result = read + tv + theatre + car + bed + alcohol + speak + drive;
  String textResult = '';

  if (result <= 2) {
    textResult = 'Норма';
  }
  if (result > 2 && result <= 8) {
    textResult = 'Инсомния (бессонница)';
  }
  if (result > 8 && result <= 15) {
    textResult = 'Синдром обструктивного апноэ сна';
  }
  if (result > 16) {
    textResult = 'Нарколепсия (гиперсомния центрального генеза)';
  }

  return Card(
    elevation: 2,
    color: Colors.amber,
    child: ListTile(
      title: h2Text(textResult),
    ),
  );
}
