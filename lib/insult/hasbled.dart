import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/main.dart';

import '../insult.dart';

class HASBLEDScreen extends StatefulWidget {
  const HASBLEDScreen({Key? key}) : super(key: key);

  @override
  State<HASBLEDScreen> createState() => _HASBLEDScreenState();
}

class _HASBLEDScreenState extends State<HASBLEDScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HASBLEDLogic(),
    );
  }
}

class HASBLEDLogic extends StatefulWidget {
  const HASBLEDLogic({Key? key}) : super(key: key);

  @override
  State<HASBLEDLogic> createState() => _HASBLEDLogicState();
}

class _HASBLEDLogicState extends State<HASBLEDLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: appBarText('HAS-BLED'),
        centerTitle: true,
      ),
    );
  }
}
