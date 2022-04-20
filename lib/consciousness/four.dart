import 'package:flutter/material.dart';
import '../consciousness.dart';

class FOURScreen extends StatefulWidget {
  const FOURScreen({Key? key}) : super(key: key);

  @override
  State<FOURScreen> createState() => _FOURScreenState();
}

class _FOURScreenState extends State<FOURScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FOURLogic(),
    );
  }
}

class FOURLogic extends StatefulWidget {
  const FOURLogic({Key? key}) : super(key: key);

  @override
  State<FOURLogic> createState() => _FOURLogicState();
}

class _FOURLogicState extends State<FOURLogic> {
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
        ),
      ),
    );
  }
}
