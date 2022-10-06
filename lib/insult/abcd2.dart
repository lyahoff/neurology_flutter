import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import '../insult.dart';

class ABSD2Screen extends StatefulWidget {
  const ABSD2Screen({Key? key}) : super(key: key);

  @override
  State<ABSD2Screen> createState() => _ABSD2ScreenState();
}

class _ABSD2ScreenState extends State<ABSD2Screen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ABCD2Logic(),
    );
  }
}

class ABCD2Logic extends StatefulWidget {
  const ABCD2Logic({Key? key}) : super(key: key);

  @override
  State<ABCD2Logic> createState() => _ABCD2LogicState();
}

class _ABCD2LogicState extends State<ABCD2Logic> {
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
          title: appBarText('ABCD2'),
          centerTitle: true,
        ),
        body: const ABCD2(),
      ),
    );
  }
}

class ABCD2 extends StatefulWidget {
  const ABCD2({Key? key}) : super(key: key);

  @override
  State<ABCD2> createState() => _ABCD2State();
}

class _ABCD2State extends State<ABCD2> {
  int age = 0;
  int ag = 0;
  int ks = 0;
  int ds = 0;
  int sd = 0;
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
                  '''Шкала ABCD2 служит для быстрой оценки риска развития раннего инсульта в течение первых 2, 7 и 90 дней после перенесенной транзиторной ишемической атаки (ТИА). Шкала ABCD2 базируется на 5 параметрах:

Age — возраст;
Blood pressure — артериальное давление;
Clinical features — клинические симптомы;
Duration of TIA — продолжительность ТИА;
Diabetes — диабет.'''),
            )),
        Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              title: h2Text('Возраст'),
            ),
            RadioListTile(
                title: h2Text('Младше 60 лет'),
                value: age,
                groupValue: 0,
                onChanged: ((value) => setState(() {
                      age = 0;
                    }))),
            RadioListTile(
                title: h2Text('Старше 60 лет'),
                value: age,
                groupValue: 1,
                onChanged: ((value) => setState(() {
                      age = 1;
                    }))),
          ]),
        ),
        Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              title: h2Text('Артериальное давление'),
            ),
            RadioListTile(
                title: h2Text('Нормальное'),
                value: ag,
                groupValue: 0,
                onChanged: ((value) => setState(() {
                      ag = 0;
                    }))),
            RadioListTile(
                title: h2Text('Выше 140/90 мм рт. ст.'),
                value: ag,
                groupValue: 1,
                onChanged: ((value) => setState(() {
                      ag = 1;
                    }))),
          ]),
        ),
        Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              title: h2Text('Клинические симптомы'),
            ),
            RadioListTile(
                title: h2Text('Гемипарез'),
                value: ks,
                groupValue: 2,
                onChanged: ((value) => setState(() {
                      ks = 2;
                    }))),
            RadioListTile(
                title: h2Text('Нарушение речи без гемипареза'),
                value: ks,
                groupValue: 1,
                onChanged: ((value) => setState(() {
                      ks = 1;
                    }))),
            RadioListTile(
                title: h2Text('Другие симптомы'),
                value: ks,
                groupValue: 0,
                onChanged: ((value) => setState(() {
                      ks = 0;
                    }))),
          ]),
        ),
        Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              title: h2Text('Длительность симптомов'),
            ),
            RadioListTile(
                title: h2Text('Менее 10 минут'),
                value: ds,
                groupValue: 0,
                onChanged: ((value) => setState(() {
                      ds = 0;
                    }))),
            RadioListTile(
                title: h2Text('10-59 минут'),
                value: ds,
                groupValue: 1,
                onChanged: ((value) => setState(() {
                      ds = 1;
                    }))),
            RadioListTile(
                title: h2Text('Более 60 минут'),
                value: ds,
                groupValue: 2,
                onChanged: ((value) => setState(() {
                      ds = 2;
                    }))),
          ]),
        ),
        Card(
          elevation: 2,
          child: Column(children: [
            ListTile(
              title: h2Text('Сахарный диабет'),
            ),
            RadioListTile(
                title: h2Text('Нет'),
                value: sd,
                groupValue: 0,
                onChanged: ((value) => setState(() {
                      sd = 0;
                    }))),
            RadioListTile(
                title: h2Text('Есть'),
                value: sd,
                groupValue: 1,
                onChanged: ((value) => setState(() {
                      sd = 1;
                    }))),
          ]),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: abcdResult(age, ag, ks, ds, sd),
        )
      ],
    );
  }
}

Widget abcdResult(int age, int ag, int ks, int ds, int sd) {
  int total = age + ag + ks + ds + sd;
  String result = '';
  if (total <= 3) {
    result =
        'Результат $total баллов\n\nНизкий риск инсульта.\n\nРиск инсульта в течение 2 дней: 1.0%.\n\nРиск инсульта в течение 1 недели: 1.2%.\nРиск инсульта в течение 3 месяцев: 3.1%';
  }
  if (total >= 4 && total <= 5) {
    result =
        'Результат $total баллов\n\nУмеренный риск инсульта.\n\nРиск инсульта в течение 2 дней: 4.1%.\nРиск инсульта в течение 1 недели: 5.9%.\nРиск инсульта в течение 3 месяцев: 9.8%';
  }
  if (total >= 6) {
    result =
        'Результат $total баллов\n\nВысокий риск инсульта.\n\nРиск инсульта в течение 2 дней: 8.1%.\nРиск инсульта в течение 1 недели: 11.7%.\nРиск инсульта в течение 3 месяцев: 17.8%';
  }
  return ListTile(
    title: h2Text(result),
  );
}
