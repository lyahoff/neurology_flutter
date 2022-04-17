import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/main.dart';

class CHA2Screen extends StatefulWidget {
  const CHA2Screen({Key? key}) : super(key: key);

  @override
  State<CHA2Screen> createState() => _CHA2ScreenState();
}

class _CHA2ScreenState extends State<CHA2Screen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CHA2Logic(),
    );
  }
}

class CHA2Logic extends StatefulWidget {
  const CHA2Logic({Key? key}) : super(key: key);

  @override
  State<CHA2Logic> createState() => _CHA2LogicState();
}

class _CHA2LogicState extends State<CHA2Logic> {
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
            runApp(const MainScreen());
          },
        ),
        title: appBarText('CHA2DS2-VASC'),
        centerTitle: true,
      ),
    );
  }
}
