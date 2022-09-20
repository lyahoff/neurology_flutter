import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import 'main.dart';

class AlgoverScreen extends StatefulWidget {
  const AlgoverScreen({Key? key}) : super(key: key);

  @override
  State<AlgoverScreen> createState() => _AlgoverScreenState();
}

class _AlgoverScreenState extends State<AlgoverScreen> {
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
              'Индекс Альговера',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: AlgoverLogic(),
        ),
      ),
    );
  }
}

class AlgoverLogic extends StatefulWidget {
  const AlgoverLogic({Key? key}) : super(key: key);

  @override
  State<AlgoverLogic> createState() => _AlgoverLogicState();
}

class _AlgoverLogicState extends State<AlgoverLogic> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Card(
            color: Colors.grey[200],
            elevation: 2,
            child: Column(
              children: [
                ListTile(
                  title: h1Text('Шоковый индекс Альговера'),
                ),
                ListTile(
                  title: h2Text(
                      '''Шоковый индекс Альговера используется для определения уровня кровопотери.

Он вычисляется как соотношение частоты пульса (ЧСС) к уровню систолического артериального давления (САД).

ШИА = ЧСС/САД. В норме он приближается к 0,5
'''),
                ),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Card(elevation: 2, child: AlgoverResult()),
      ],
    );
  }
}

class AlgoverResult extends StatefulWidget {
  const AlgoverResult({Key? key}) : super(key: key);

  @override
  State<AlgoverResult> createState() => _AlgoverResultState();
}

class _AlgoverResultState extends State<AlgoverResult> {
  String hrText = '0.0';
  String adText = '0.0';
  double hr = 0.0;
  double ad = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          maxLength: 3,
          decoration: InputDecoration(hintText: 'Введите значение ЧСС'),
          onChanged: (text) => setState(() {
            hrText = text;
            if (hrText.isEmpty) {
              hrText = '0.0';
            }
            hr = double.parse(hrText);
          }),
        ),
        TextField(
          keyboardType: TextInputType.number,
          maxLength: 3,
          decoration: InputDecoration(hintText: 'Введите значение САД'),
          onChanged: (text) => setState(() {
            adText = text;
            if (adText.isEmpty) {
              adText = '0.0';
            }
            ad = double.parse(adText);
          }),
        ),
        ListTile(
          title: result(hr, ad),
        )
      ],
    );
  }
}

Widget result(double a, double b) {
  var result = a / b;
  String algoverResult = '';
  var toLow = result.toStringAsFixed(2);

  if (result <= 0.5) {
    algoverResult = 'Результат составляет $toLow, что соответствует норме';
  }
  if (result > 0.5 && result <= 0.9) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку I степени. Потеря ОЦК 15-20%';
  }
  if (result > 0.9 && result <= 1.2) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку II степени. Потеря ОЦК 20-40%';
  }
  if (result >= 1.2) {
    algoverResult =
        'Результат составляет $toLow, что соответствует шоку III степени. Потеря ОЦК более 40%';
  }
  return h1Text(algoverResult);
}
