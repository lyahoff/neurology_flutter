import 'package:flutter/material.dart';
import 'package:neurology_flutter/cards.dart';
import 'package:neurology_flutter/main.dart';

import '../insult.dart';

class NIHSSScreen extends StatefulWidget {
  const NIHSSScreen({Key? key}) : super(key: key);

  @override
  State<NIHSSScreen> createState() => _NIHSSScreenState();
}

class _NIHSSScreenState extends State<NIHSSScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NIHSSLogic(),
    );
  }
}

class NIHSSLogic extends StatefulWidget {
  const NIHSSLogic({Key? key}) : super(key: key);

  @override
  State<NIHSSLogic> createState() => _NIHSSLogicState();
}

class _NIHSSLogicState extends State<NIHSSLogic> {
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
          title: appBarText('NIHSS'),
          centerTitle: true,
        ),
      ),
    );
  }
}
