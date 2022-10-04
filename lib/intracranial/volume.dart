import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/intracranial.dart';

class VulumeScreen extends StatefulWidget {
  const VulumeScreen({Key? key}) : super(key: key);

  @override
  State<VulumeScreen> createState() => _VulumeScreenState();
}

class _VulumeScreenState extends State<VulumeScreen> {
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
              'Расчет объема внутричерепного кровоизлияния',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: const VolumeLogic(),
        ),
      ),
    );
  }
}

class VolumeLogic extends StatefulWidget {
  const VolumeLogic({Key? key}) : super(key: key);

  @override
  State<VolumeLogic> createState() => _VolumeLogicState();
}

class _VolumeLogicState extends State<VolumeLogic> {
  String diametrText = '';
  String biggestDiametrText = '';
  String cutsText = '';
  double diametr = 0.0;
  double biggestDiametr = 0.0;
  double cuts = 0.0;
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
                'Данный калькулятор может быть использован для расчета внутрипаренхимального кровоизлияния'),
          ),
        ),
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  title: h2Text('Самый большой диаметр кровоизлияния на КТ'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: const InputDecoration(
                      hintText: 'см', border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {
                    diametrText = value;
                    if (diametrText.isEmpty) {
                      diametrText = '0.0';
                    }
                    diametr = double.parse(diametrText);
                  }),
                ),
                ListTile(
                  title:
                      h2Text('Наибольший диаметр 90° до А на том же срезе КТ'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: const InputDecoration(
                      hintText: 'см', border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {
                    biggestDiametrText = value;
                    if (biggestDiametrText.isEmpty) {
                      biggestDiametrText = '0.0';
                    }
                    biggestDiametr = double.parse(biggestDiametrText);
                  }),
                ),
                ListTile(
                  title: h2Text(
                      'Количество срезов КТ 10 мм, на которых видно кровоизлияние'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: const InputDecoration(
                      hintText: 'см', border: OutlineInputBorder()),
                  onChanged: (value) => setState(() {
                    cutsText = value;
                    if (cutsText.isEmpty) {
                      cutsText = '0.0';
                    }
                    cuts = double.parse(cutsText);
                  }),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.amber,
          child: volumeResult(diametr, biggestDiametr, cuts),
        )
      ],
    );
  }
}

Widget volumeResult(double diametr, double biggestDiametr, double cuts) {
  double total = (diametr * biggestDiametr * cuts) / 2;
  String result = 'Объем внутричерепного кровоизлияния: $total см³';
  return ListTile(
    title: h2Text(result),
  );
}
