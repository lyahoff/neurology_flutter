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
            ))
      ],
    );
  }
}
