import 'package:flutter/material.dart';
import 'cards.dart';
import 'main.dart';

class IntracranialScreen extends StatefulWidget {
  const IntracranialScreen({Key? key}) : super(key: key);

  @override
  State<IntracranialScreen> createState() => _IntracranialScreenState();
}

class _IntracranialScreenState extends State<IntracranialScreen> {
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
            'Внутричерепное кровоизлияние',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            customCard(
                'Оценка функциональной самостоятельности после внутричерепного кровоизлияния',
                'assets/function.png'),
            customCard('Расчет объема внутричерепного кровоизлияния',
                'assets/volume.png'),
          ],
        ),
      ),
    );
  }
}
