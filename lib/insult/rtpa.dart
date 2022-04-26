import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';

import '../insult.dart';

class RTpaScreen extends StatefulWidget {
  const RTpaScreen({Key? key}) : super(key: key);

  @override
  State<RTpaScreen> createState() => _RTpaScreenState();
}

class _RTpaScreenState extends State<RTpaScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RTpaLogic(),
    );
  }
}

class RTpaLogic extends StatefulWidget {
  const RTpaLogic({Key? key}) : super(key: key);

  @override
  State<RTpaLogic> createState() => _RTpaLogicState();
}

class _RTpaLogicState extends State<RTpaLogic> {
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
          title: appBarText('rt-PA'),
          centerTitle: true,
        ),
      ),
    );
  }
}
