import 'package:flutter/material.dart';
import 'package:neurology_flutter/intracranial.dart';

class FunctionalityScreen extends StatefulWidget {
  const FunctionalityScreen({Key? key}) : super(key: key);

  @override
  State<FunctionalityScreen> createState() => _FunctionalityScreenState();
}

class _FunctionalityScreenState extends State<FunctionalityScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FunctionalityLogic(),
    );
  }
}

class FunctionalityLogic extends StatefulWidget {
  const FunctionalityLogic({Key? key}) : super(key: key);

  @override
  State<FunctionalityLogic> createState() => _FunctionalityLogicState();
}

class _FunctionalityLogicState extends State<FunctionalityLogic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          runApp(const IntracranialScreen());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                runApp(const IntracranialScreen());
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Оценка функциональной самостоятельности после внутричерепного кровоизлияния',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
