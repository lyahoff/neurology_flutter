import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/insult/cha2ds2.dart';
import 'package:neurology_flutter/insult/nihss.dart';
import 'package:neurology_flutter/main.dart';

class InsultScreen extends StatefulWidget {
  const InsultScreen({Key? key}) : super(key: key);

  @override
  State<InsultScreen> createState() => _InsultScreenState();
}

class _InsultScreenState extends State<InsultScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            'Ишемический инсульт/Профилактика сердечно-сосудистых заболеваний',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            InkWell(
              onTap: () {
                runApp(const NIHSSScreen());
              },
              child: customCard(
                  'Шкала инсульта национального института здоровья (NIHSS)',
                  'assets/nihss.png'),
            ),
            InkWell(
              onTap: () {
                runApp(const CHA2Screen());
              },
              child: customCard(
                  'Шкала CHA2DS2-VASC\nоценки риска инсульта и системной тромбоэмболии у пациентов с фибрилляцией предсердий',
                  'assets/cha2.png'),
            ),
            customCard(
                'Шкала HAS-BLED \nоценки риска кровотечений при мерцательной аритмии',
                'assets/has.png'),
            customCard('Шкала ABCD2', 'assets/abcd.png'),
            customCard('Расчет дозы rt-PA', 'assets/rt.png'),
            customCard('Шкала Рэнкина', 'assets/renkin.png'),
          ],
        ),
      ),
    );
  }
}
