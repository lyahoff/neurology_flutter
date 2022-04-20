import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/main.dart';

import '../insult.dart';

class RenkinScreen extends StatefulWidget {
  const RenkinScreen({Key? key}) : super(key: key);

  @override
  State<RenkinScreen> createState() => _RenkinScreenState();
}

class _RenkinScreenState extends State<RenkinScreen> {
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
          title: appBarText('Шкала Ренкина'),
          centerTitle: true,
        ),
      ),
    );
  }
}
