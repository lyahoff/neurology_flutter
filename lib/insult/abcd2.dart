import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/main.dart';

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
        title: appBarText('ABCD2'),
        centerTitle: true,
      ),
    );
  }
}
