import 'package:flutter/material.dart';

import 'cards.dart';
import 'main.dart';

class ConsciousnessScreen extends StatefulWidget {
  const ConsciousnessScreen({Key? key}) : super(key: key);

  @override
  State<ConsciousnessScreen> createState() => _ConsciousnessScreenState();
}

class _ConsciousnessScreenState extends State<ConsciousnessScreen> {
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
            'Уровень сознания',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            customCard('Шкала комы Глазго', 'assets/glazgo.png'),
            customCard('Детская шкала комы Глазго', 'assets/glazgo.png'),
            customCard('Шкала комы FOUR', 'assets/glazgo.png'),
            customCard(
                'Шкала возбуждения-седации Ричмонда', 'assets/glazgo.png'),
          ],
        ),
      ),
    );
  }
}
